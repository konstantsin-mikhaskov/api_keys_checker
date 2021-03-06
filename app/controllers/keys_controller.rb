class KeysController < ApplicationController
  respond_to :html, :json

  def index
    @per_page = 25
    params[:page] ? @page = params[:page] : @page = 1
    @keys = Key.paginate(page: @page, per_page: @per_page)
  end

  def show
    @key = Key.find params[:id]
    respond_modal_with @key
  end

  def check_availability
    @key = Key.find params[:id]
    asin = params[:key][:asin]
    request_url = helpers.form_check_query(@key,asin)
    @response_xml = helpers.execute_check_query(request_url)
    @key.after_check(@response_xml)
    respond_to do |format|
      format.xml { render xml: @response_xml}
    end
  end

  def key_params
    params.require(:key).permit(:id, :asin)
  end
end
