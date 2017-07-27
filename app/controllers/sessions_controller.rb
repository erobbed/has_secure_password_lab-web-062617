class SessionsController < ApplicationController

  def new
  end

  def create
    # binding.pry
    @user = User.find_by(name: params[:user][:name])
    # binding.pry
    return redirect_to login_path flash[:mesage] = 'login failed!' unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to welcome_path
  end
end
