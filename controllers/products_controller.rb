require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative("../models/product")
# require_relative("../models/stock")
require_relative("../models/supplier")
also_reload("../models/*")

get '/products' do
  @products = Product.all()
  erb (:"products/index")
end

get '/products/new' do
    @suppliers = Supplier.all
    erb (:"products/new")
end

post '/products/:id' do
  @product = Product.new(params)
  @product.update()
  redirect to ("/products")
end

post '/products' do
  @product = Product.new(params)

  @product.save()
  redirect to("/products")
end



get '/products/:id/edit' do
  @suppliers = Supplier.all
  @product = Product.find(params[:id])
  erb (:"products/edit")
end

get '/products/:id' do
  @product = Product.find(params[:id])
  erb (:"products/show")
end



post '/products/:id/delete' do
  id = params[:id]
  product = Product.find(id)
  product.delete()
  redirect '/products'
end
