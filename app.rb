require 'sinatra'
require 'erb'
require 'pry-byebug'


get '/' do
  erb :home
end

get '/secrets/new' do
  # A "Secret" is a resource of its own so we'll nest its
  # views in the /views/secrets folder
  # Remember that views automatically look in the views/ 
  # folder already so we only need to specify /secrets/new
  erb :"secrets/new"
end

post '/secrets' do

  # 

end