require 'sinatra'
require 'erb'
require 'pry-byebug'
require './models/secret.rb'


get '/' do
  erb :home
end


get '/secret/new' do

  # A "Secret" is a resource of its own so we'll nest its
  # views in the /views/secret folder
  # Remember that views automatically look in the views/ 
  # folder already so we only need to specify /secret/new
  erb :"secret/new"

end


post '/secret' do

  # "Create" a secret with our model object
  # Right now, this will "save" the secret to
  # the session and return the secret object.  
  # In the future, we could also write validations into
  # the model code so, for instance, the secret has to 
  # be a certain length.  It keeps things modular.
  @secret = Secret.create( params[:secret_text] )

  # Send us to the secret page, which has access to @secret
  erb :"secret/show"

end