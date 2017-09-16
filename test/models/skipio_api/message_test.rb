require 'test_helper'

class Message < ActiveSupport::TestCase
  test 'send message successfully' do
    token = ENV['SKIPIO_STAGING_TOKEN']
    contact_id = '373dfcb8-224c-4253-b4fd-c080569984e1'
    message_body = 'Hey mate, how are you today? See you tomorrow'

    response = SkipioApi::Message.send(token, contact_id, message_body)

    assert SkipioApi::Message.success?(response)
  end
end