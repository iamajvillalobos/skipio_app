module Skipio
  class Contact
    attr_reader :skipio_id,
                :name,
                :email,
                :phone_number,
                :avatar_url

    def initialize(data)
      @skipio_id = data['id']
      @name = data['full_name']
      @email = data['email']
      @phone_number = data['phone_mobile']
      @avatar_url = data['avatar_url']
    end
  end
end
