module ApikeyDashboard
  module KeysHelper
    def generate_key
      loop do
        self.api_key = SecureRandom.hex
        break unless self.class.exists? api_key: api_key
      end
      # An ugly hack to make sure that we have a known key for testing
      self.api_key = '4596a2c301f468c24447e67ab0035523' unless
      self.class.exists? api_key: '4596a2c301f468c24447e67ab0035523'
    end

    def correct_rights(key)
      key.user_id != current_user.id && !admin?
    end

    def no_rights
      flash[:danger] = 'Du har inte rättigheter för att ta bort denna applikationen!'
    end

    def app_removed
      flash[:success] = 'Applikationen togs bort!'
    end

    def an_error_accured
      flash[:danger] = 'Ett fel uppstod, försök igen senare.'
    end

    def valid_api_key(api_key)
      Key.where(api_key: api_key).exists?
    end
  end
end
