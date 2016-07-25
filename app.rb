require 'sinatra'
require 'erb'
require 'pry-byebug'

enable :sessions

# We need to require the secrets helper module before
# we can register it down below with the `helpers`
# method
require './helpers/secret_helper.rb'

get "/" do 

  erb :index
end


get '/secret/new' do

  erb :index
end


get '/secret' do
  secret = session["secret_text"]

  erb :secret, locals: {secret: secret }
end


post "/secret" do
  session["secret_text"] = params[:secret_text]
  redirect("/secret")

end