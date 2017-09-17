module SkipioApi
  class Message
    def self.send(token, contact_id, message_body)
      url = "#{ENV['SKIPIO_STAGING_URL']}/messages?"
      url += "token=#{token}"
      body = build_body(contact_id, message_body)
      HTTParty.post(url, body: body).parsed_response
    end

    def self.from_contact(token, contact_id)
      url = "#{ENV['SKIPIO_STAGING_URL']}/contacts/#{contact_id}"
      url += "/messages?token=#{token}"
      response = HTTParty.get(url).parsed_response
      response['data'].sort_by { |message| message['time'] }.reverse
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