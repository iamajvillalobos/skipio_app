module SkipioApi
  class Message
    def self.send(token, contact_id, message_body)
      url = build_url(token)
      body = build_body(contact_id, message_body)
      HTTParty.post(url, body: body).parsed_response
    end

    def self.success?(response)
      return true if response.nil?
      false
    end

    def self.build_url(token)
      url = "#{ENV['SKIPIO_STAGING_URL']}/messages?"
      url += "token=#{token}"
    end
    
    def self.build_body(contact_id, message_body)
      {
        "recipients": [
          "contact-#{contact_id}"
        ],

        "message": {
          "body": message_body
        }
      }
    end
  end
end