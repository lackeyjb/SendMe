class TextMessagesController < ApplicationController

  def send_message
    TextMessage.send_user_info(current_user, params[:text_messages][:phone_number])
  end
end