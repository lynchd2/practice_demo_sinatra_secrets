require 'sinatra'
require 'erb'
require 'pry-byebug'
require './helpers/secret_helper.rb'

# Register our SecretHelper module so it's available
# here and in our views
helpers SecretHelper

# Enable sessions so we can use the `session` hash
enable :sessions


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

  # Save our new secret using our helper method, which
  # returns the secret text as well
  @secret_text = save_secret( params[:secret_text] )

  # Redirect us to the secret showing page (get '/secret')
  redirect to("secret")

end


get '/secret' do

  # Load our secret from the session hash
  @secret_text = load_secret

  # Render the template with that secret
  erb :"secret/show"

end