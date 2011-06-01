class SessionsController < ApplicationController

  def new
    @title = "Sign in"

  end
  
  def create
	user = User.find_by_email(params[:session][:email])
	
	if user.nil?
	  @title = "Sign in"
	  redirect_to signup_path, :notice => "It's the first time you login, we need some information from you"
	else
	  sign_in user
	  redirect_back_or user
	end
  end
  
  def destroy
    sign_out
	  redirect_to root_path
  end

end
