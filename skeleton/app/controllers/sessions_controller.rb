class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid username or password"]
      redirect_to new_session_url
    end
  end



  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
    end
    redirect_to new_session_url
  end
end
