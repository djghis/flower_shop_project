require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative("../models/product")
# require_relative("../models/stock")
require_relative("../models/supplier")
also_reload("../models/*")

get '/suppliers' do
  @suppliers = Supplier.all()
  erb (:"suppliers/index")
end

get '/suppliers/new' do
  erb(:"suppliers/new")
end

post '/suppliers' do
  @supplier = Supplier.new(params)
  @supplier.save()
  redirect to ("suppliers")
end

get '/suppliers/:id' do
  @supplier = Supplier.find(params[:id])
  @products = Product.all

  erb (:"suppliers/show")
end



post '/suppliers/:id' do
  @supplier = Supplier.new(params)
  @supplier.update()
  redirect to("/suppliers")
end

get '/suppliers/:id/edit' do
  @supplier = Supplier.find(params[:id])
  erb (:"suppliers/edit")
end

post '/suppliers/:id/delete' do
  id = params[:id]
  supplier = Supplier.find(id)
  supplier.delete()
  redirect to ("suppliers")
end
