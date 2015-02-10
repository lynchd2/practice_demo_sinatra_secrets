# The model class which will allow us to pass around a Secret.
# We'll store it in the session hash as a simple string
# to avoid the problems of re-instantiating objects in JSON.

# This is meant to show you a good modular approach for
# thinking about models which will be useful when we get into
# databases (read: you'll see this again... frequently)
class Secret

  attr_reader :text


  def initialize(text)
    @text = text
  end


  # Create a new secret based on its text and save it 
  # to the session hash
  def self.create(text)


    # Instantiate and return the Secret object.
    # The `self` is implicit
    secret = new(text)

    # Save it to the session (implicit `self` here)
    secret.save

    # Return the secret
    secret
    
  end

  # Save the Secret to the session hash
  # Again, the `self` is implicit for `self.text`
  def save
    session[:secret_text] = text
  end


  # Load the secret from the session
  # Again, the `self` is implicit
  def load
    new(session[:secret_text])
  end

end