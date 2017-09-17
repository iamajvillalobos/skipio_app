class MessagesController < ApplicationController
  def new
    @contact = {
      contact_name: params[:contact_name],
      contact_id: params[:contact_id]
    }
  end

  def create
    token = ENV['SKIPIO_STAGING_TOKEN']
    contact_id = params[:contact_id]
    contact_name = params[:contact_name]
    message_body = params[:body]
    SkipioApi::Message.send(token, contact_id, message_body)
    redirect_to messages_path(contact_id: contact_id, contact_name: contact_name)
  end

  def show
    token = ENV['SKIPIO_STAGING_TOKEN']
    contact_id = params[:contact_id]
    @contact_name = params[:contact_name]
    @messages = SkipioApi::Message.from_contact(token, contact_id)
  end
end
