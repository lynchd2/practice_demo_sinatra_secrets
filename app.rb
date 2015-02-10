require 'sinatra'
require 'erb'
require 'pry-byebug'
require './models/secret.rb'


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

  # "Create" a secret in our model object
  # Right now, this will "save" the secret to
  # the session.  We could also write validations into
  # the model code so, for instance, the secret has to 
  # be a certain length.  It keeps things modular.
  secret = Secret.create( :text => params[:secret] )


end