class ContactsController < ApplicationController
  def index
    token = ENV['SKIPIO_STAGING_TOKEN']
    @contacts = SkipioApi::Contact.all(token)
  end
end