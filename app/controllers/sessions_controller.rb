class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to user
      # log the user in and redirect to the user's show page
    else
      # Create an error mennage.
      flash.now[:danger] = 'invalid email/password combination'  # not quite right
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
