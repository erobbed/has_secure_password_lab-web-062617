class UsersController < ApplicationController

  def index
    @user = User.find(session[:user_id])
  end

  def new

  end

  def create
    @user = User.create(user_params)
    # binding.pry
    return redirect_to new_user_path unless params[:user][:password] == params[:user][:password_confirmation]
    session[:user_id] = @user.id
    redirect_to welcome_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
