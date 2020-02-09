require_relative( "../models/product" )
require_relative( "../models/stock" )
require_relative( "../models/supplier" )
require("pry-byebug")

Product.delete_all()
# Stock.delete_all()
Supplier.delete_all()

supplier1 = Supplier.new({
  "name" => "J van Vliet",
  "adress" => "22 Stenhouse Mill Wynd, Edinburgh EH11 3XX",
  "phone" => "01314435228",
  "email" => "info@jvvcc.co.uk"
  })

  supplier1.save()

supplier2 = Supplier.new({
  "name" => "Country Basket",
  "adress" => "2297 Blochairn Road Blochairn Glasgow G21 2DU",
  "phone" => "01415527781",
  "email" => "glasgow@countrybaskets.co.uk"
  })

  supplier2.save()

product1 = Product.new({
  "name" => "flute vase 20cm",
  "description" => "Clear vase 20cm high",
  "buy_cost" => 12,
  "sell_price" => 20
  })

  product1.save()

product2 = Product.new({
  "name" => "lily vase 45cm",
  "description" => "Clear long neck vase 45cm high",
  "buy_cost" => 9,
  "sell_price" => 25
  })

  product2.save()



binding.pry
nil
