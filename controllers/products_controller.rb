require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative("../models/product")
# require_relative("../models/stock")
# require_relative("../models/supplier")
also_reload("../models/*")

get '/products' do
  @products = Product.all()
  erb (:"products/index")

end
