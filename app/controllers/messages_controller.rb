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
    message_body = params[:body]
    response = SkipioApi::Message.send(token, contact_id, message_body)
    redirect_to contacts_path
  end
end