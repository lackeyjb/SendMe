class SessionsController < ApplicationController
  before_action :redirect_if_signed_in, except: [:destroy]

  def new   
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user_path user
    else
      flash.now[:danger] = 'Invalid email/password combination.'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end