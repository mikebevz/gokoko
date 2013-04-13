class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]

    # Try to find authentication first
    authentication = Authentication.where(:provider => auth['provider'], :uid => auth['uid']).first
    
    if authentication
      # Authentication found, sign the user in.
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication.user)
    else
      # Authentication not found, thus a new user.
      user = User.new
      user.apply_omniauth(auth)
      if user.save(:validate => false)
        flash[:notice] = "Account created and signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        flash[:error] = "Error while creating a user account. Please try again."
        redirect_to root_url
      end
    end
  end
  
  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end
  
  def new
    redirect_to '/auth/facebook'
  end
  
  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
  
  
end