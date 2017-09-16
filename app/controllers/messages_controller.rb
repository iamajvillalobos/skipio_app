class MessagesController < ApplicationController
  def new
    @contact = {
      contact_name: params[:contact_name],
      contact_id: params[:contact_id]
    }
  end
end