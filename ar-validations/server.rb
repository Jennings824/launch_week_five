require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pry'
require-relative 'models/comment'
require-relative 'models/recipe'

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do

  erb :index
end
