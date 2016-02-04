module KeysHelper
  def generate_key
    begin
      self.api_key = SecureRandom.hex
    end while self.class.exists? api_key: api_key
  end
end
