require ('sinatra')
require ('sinatra/contriv/all')
require ('pry-byebug')

require_relative("../models/stock")

also_reload("../models*")

# get '/stocks' do
#     @stock = Stock.all()
#     erb (:"stock/index")
# end
