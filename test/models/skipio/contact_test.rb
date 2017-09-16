require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test 'initialize with correct attributes' do
    token = ENV['SKIPIO_STAGING_TOKEN']
    contacts = SkipioApi::Contact.all(token, 1, 1)
    first_contact = contacts.first

    assert first_contact.skipio_id
    assert first_contact.name
    assert first_contact.phone_number
    assert first_contact.avatar_url
  end
end