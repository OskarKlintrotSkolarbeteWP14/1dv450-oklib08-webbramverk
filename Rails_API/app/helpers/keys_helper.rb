module KeysHelper
  def generate_key
    self.api_key = SecureRandom.hex

    # Make sure the key has not been used before
    while Key.find_by_api_key(self.api_key) do
      self.api_key = SecureRandom.hex
    end
  end
end
