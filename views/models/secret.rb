# The model class which will allow us to pass around Secrets.
# We'll store Secrets in the session hash as simple hashes
# to avoid the problems of re-instantiating objects in JSON.
# This isn't the best data structure but this is for illustration
# of more advanced concepts you'll use later.

# This model is more complex than it needs to be for this exact
# application but is meant to show you a good modular approach
# to thinking about models which will be useful when we get into
# databases (read: you'll see this again... frequently)
class Secret

  attr_reader :text, :id


  # Initialize a new Secret
  def initialize(attributes)
    @text = attributes[:text]
  end


  # Grab all secrets from the session and re-instantiate them
  # into an array of Secret objects
  def self.all

    # Will return the array of instantiated Secret objects
    session[:secrets].map do |secret_hash|

      # Rebuild the secret based on our hash values
      Secret.new( :text => secret_hash[:text], 
                  :id => secret_hash[:id] )
    end
  end


  # Create a new secret based on a hash of attributes
  # This is just a convenience wrapper for `new` and `save`
  def self.create(attributes)
    secret = self.new(attributes)
    secret.save
  end

  # Save the Secret to the session hash
  def save

    # If there's an existing Secret with this ID, just
    # update it
    if self.exists?

      # Pull out the existing 
      secret = session[:secrets] << self.text
  end


  def update_existing(attributes)

  end


  private

  # Check whether the current Secret actually exists in the session
  def exists?
    a.any?{|h| h[:id] == self.id }
  end



end