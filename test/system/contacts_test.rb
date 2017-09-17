require 'application_system_test_case'

class ContactsTest < ApplicationSystemTestCase
  test 'visiting /contacts will see a list of users contacts' do
    visit contacts_path

    assert_selector 'h2', text: 'Contacts'
    assert_selector 'a', text: 'New SMS'
    assert_selector 'a', text: 'View SMS'
  end
end