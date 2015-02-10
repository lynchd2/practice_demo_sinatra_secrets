module SecretHelper

  # Save the secret to the session hash
  # Again, the `self` is implicit for `self.text`
  def save_secret(secret_text)
    session["secret_text"] = secret_text
  end


  # Load the secret from the session
  def load_secret
    session["secret_text"]
  end

end