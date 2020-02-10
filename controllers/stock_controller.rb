require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')

require_relative("../models/stock")
require_relative("../models/product")

also_reload("../models*")

get '/stocks' do
    @product = Stock.product_name()
    erb (:"stock/index")
end

get '/stocks/new' do
    erb (:"stock/new")
end

post '/stocks/:id' do
  @stock = Stock.new(params)
  @stock.update()
  redirect to ("/stocks")
end

post '/stocks' do
  @stock = Stock.new(params)
  @stock.save()
  redirect to("/stocks")
end



get '/stocks/:id/edit' do
  @stock = Stock.find(params[:id])
  erb (:"stock/edit")
end

get '/stocks/:id' do
  @stock = Stock.find(params[:id])
  erb (:"stock/show")
end



post '/stocks/:id/delete' do
  id = params[:id]
  stock = Stock.find(id)
  stock.delete()
  redirect '/stocks'
end
