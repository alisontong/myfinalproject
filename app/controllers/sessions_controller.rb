class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
  	user = User.find_by_username(user_params[:username])
    # if user exists AND password entered is correct
    if user && user.authenticate(user_params[:password])
  		session[:user_id] = user.id
  		redirect_to users_path
  	else
      flash[:error] = "Incorrect username or password. Try again."
  		redirect_to login_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end
  
 private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
