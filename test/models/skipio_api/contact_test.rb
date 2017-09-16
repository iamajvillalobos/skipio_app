require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test '#all responses are instance of Skipio::Contact' do
    token = ENV['SKIPIO_STAGING_TOKEN']
    response = SkipioApi::Contact.all(token, 1, 1)
    contact = response.first

    assert_instance_of Skipio::Contact, contact
  end

  test '#all returns a certain amount of contact' do
    token = ENV['SKIPIO_STAGING_TOKEN']
    response = SkipioApi::Contact.all(token, 1, 10)

    assert_equal 10, response.count
  end
end