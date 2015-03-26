class TextMessagesController < ApplicationController

  VALID_PHONE_NUMBER_REGEX = /^(\+0?1\s)?\(?\d{3}\)?[\s.]\d{3}[\s.]\d{4}$/

  def send_message
    # if params[:phone_number] == VALID_PHONE_NUMBER_REGEX.match("#{params[:phone_number]}")
      account_sid  = 'AC01b73dc19e96d27b4a493086460799b7'
      auth_token   = '3eceeae4edd02236003b89b0443765a0'
      @client = Twilio::REST::Client.new account_sid, auth_token
      @client.messages.create(
        body: "#{current_user.name} \n #{current_user.email} \n #{current_user.addition_info}",
        to:   "+1" + params[:text_messages][:phone_number],
        from: "+16789168205")
    # end
  end
end