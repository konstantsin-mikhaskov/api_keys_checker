# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
email_service_list = [
    ["paul9901wagner@gmail.com", "paul9901wagner!"],
    ["paul9901wagner@gmail.com", "paul9901wagner!"],
    ["sweet.cake.2@mailinator.com", "moc.rotaniliam@2.ekac.teews"],
    ["sweet.cake.2@mailinator.com", "moc.rotaniliam@2.ekac.teews"],
    ["pfamazon_de_berlin@mailinator.com", "qwerty123"],
    ["pfamazon_de_berlin@mailinator.com", "qwerty123"],
    ["pfamazon_de_german@mailinator.com", "qwerty123"],
    ["pfamazon_de_german@mailinator.com", "qwerty123"],
    ["sweet.cake.3@mailinator.com", "moc.rotaniliam@3.ekac.teews"],
    ["sweet.cake.3@mailinator.com", "moc.rotaniliam@3.ekac.teews"],
    ["pfamazon3@mailinator.com", "pfamazon3@"],
    ["pfamazon3@mailinator.com", "pfamazon3@"],
    ["amazain@mailinator.com", "password"],
    ["pfamazonit1@mailinator.com", "pfamazonit1@"],
    ["pfamazonit1@mailinator.com", "pfamazonit1@"],
    ["pfamazon3@mailinator.com", "pfamazon3@"],
    ["pfamazon3@mailinator.com", "pfamazon3@"],
    ["nebesnaya.shpana@mailinator.com", "do-nebes-daleko"],
    ["nebesnaya.shpana@mailinator.com", "do-nebes-daleko"],
    ["nebesnie-yasli@mailinator.com", "pf-detsad"],
    ["nebesnie-yasli@mailinator.com", "pf-detsad"],
    ["gipopotom@mailinator.com", "gipopotom"],
    ["gipopotom@mailinator.com", "gipopotom"],
    ["pf_vitalique@mailinator.com", "pfpassword"],
    ["pf_vitalique@mailinator.com", "pfpassword"],
    ["arcadzi-power@mailinator.com", "pfarkadzi"],
    ["arcadzi-power@mailinator.com", "pfarkadzi"],
    ["nebesniy-antihajp@mailinator.com", "antihajp"],
    ["nebesniy-antihajp@mailinator.com", "antihajp"],
    ["dqvpered@mailinator.com", "pfpassword"],
    ["dqvpered@mailinator.com", "pfpassword"]
]

email_service_list.each do |email_service|
  EmailService.create( name: email_service[0], password: email_service[1] )
end

shop_list = [
    ["amazon.de", "de", "de"],
    ["amazon.ca", "ca", "ca"],
    ["amazon.co.uk", "co.uk", "co.uk"],
    ["amazon.es", "es", "es"],
    ["amazon.in", "in", "in"],
    ["amazon.it", "it", "it"],
    ["amazon.co.jp", "co.jp", "co.jp"],
    ["amazon.com", "com", "com"],
    ["amazon.fr", "fr", "fr"]
]

shop_list.each do |shop|
  Shop.create( name: shop[0], domain: shop[1], api_domain: shop[2] )
end