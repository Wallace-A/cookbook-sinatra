require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative "cookbook"
require_relative "recipe"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

csv_file   = File.join(__dir__, 'recipes.csv')


get '/' do #basic web address
  csv_file   = File.join(__dir__, 'recipes.csv')
  @cookbook = Cookbook.new(csv_file)
  erb :index
end

get '/about' do #/about
  erb :about
end

get '/team/:username' do
  puts params[:username]
  "The username is #{params[:username]}"
end