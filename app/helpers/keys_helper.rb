require 'time'
require 'uri'
require 'openssl'
require 'base64'

module KeysHelper
  def form_check_query(key,asin)
    account = Account.find(key.account_id)
    shop = Shop.find(account.shop_id)
    endpoint = "webservices.amazon.#{shop.domain}"
    request_uri = "/onca/xml"
    params = {
        "Service" => "AWSECommerceService",
        "Operation" => "ItemLookup",
        "AWSAccessKeyId" => key.access_key_id,
        "AssociateTag" => "none",
        "ItemId" => asin,
        "IdType" => "ASIN",
        "ResponseGroup" => "Images,ItemAttributes,Offers"
    }
    params["Timestamp"] = Time.now.gmtime.iso8601 if !params.key?("Timestamp")
    canonical_query_string = params.sort.collect do |key, value|
      [URI.escape(key.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")), URI.escape(value.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))].join('=')
    end.join('&')
    string_to_sign = "GET\n#{endpoint}\n#{request_uri}\n#{canonical_query_string}"
    signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), key.secret_access_key, string_to_sign)).strip()
    request_url = "http://#{endpoint}#{request_uri}?#{canonical_query_string}&Signature=#{URI.escape(signature, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}"

    puts "Signed URL: \"#{request_url}\""
    request_url
  end

  def execute_check_query(url)
    c = Curl::Easy.new(url) do|curl|
      curl.on_success {|easy| puts "success, add more easy handles" }
      curl.on_missing { |easy| puts "fail" }
    end
    c.perform
    c.body_str
  end
end