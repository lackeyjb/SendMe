class TextMessage

  VALID_PHONE_NUMBER_REGEX = /^[0-9]+$/

  def self.configure_twilio
    account_sid  = 'AC01b73dc19e96d27b4a493086460799b7'
    auth_token   = '3eceeae4edd02236003b89b0443765a0'
    Twilio::REST::Client.new account_sid, auth_token
  end

  def self.send_user_info(user, phone_number) 
    configure_twilio.messages.create(
      body: "#{user.name} \n #{user.email} \n #{user.addition_info}",
      to:   "+1" + phone_number,
      from: "+16789168205") if valid_phone_number?(phone_number)
  end

  def self.valid_phone_number?(phone_number)
    phone_number == VALID_PHONE_NUMBER_REGEX.match(phone_number).to_s
  end
end