require ('sinatra')
require ('sinatra/contriv/all')
require ('pry-byebug')

require_relative("../models/stock")

also_reload("../models*")

get '/stocks' do
    @stock = Stock.all()
    erb (:"stock/index")
end

get '/stocks/new' do
    erb (:"stocks/new")
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
  erb (:"stocks/edit")
end

get '/stocks/:id' do
  @stock = Stock.find(params[:id])
  erb (:"stocks/show")
end



post '/stocks/:id/delete' do
  id = params[:id]
  stock = Stock.find(id)
  stock.delete()
  redirect '/stocks'
end
