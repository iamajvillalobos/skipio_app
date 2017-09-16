module SkipioApi
  class Contact
    def self.all(token, page=1, per=100)
      url = build_url(token, page, per)
      response = HTTParty.get(url).parsed_response
      response['data'].map do |details|
        Skipio::Contact.new(details)
      end
    end

    def self.build_url(token, page, per)
      url = "#{ENV['SKIPIO_STAGING_URL']}/contacts?"
      url += "token=#{token}"
      url += "&page=#{page}"
      url += "&per=#{per}"
    end
  end
end
