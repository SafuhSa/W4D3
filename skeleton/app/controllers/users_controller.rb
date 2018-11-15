class UsersController < ApplicationController
  before_action :require_log_out, only: [:new]
  before_action :require_logged_in, only: [:show]
  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)

    if @user.save
        # login(@user)
        redirect_to user_url(@user)
    else
        flash[:errors] = ['it didn\'t work']#@user.errors.full_messages
        redirect_to new_user_url
    end
  end



  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
