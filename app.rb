require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/products_controller')
# require_relative('controllers/stock_controller')
require_relative('controllers/suppliers_controller')

get '/' do
  erb( :index )
end
