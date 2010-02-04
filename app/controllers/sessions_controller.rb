class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by_email(params[:session][:email])
    if @user.crypted_password == params[:session][:password]
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You have logged in"
    else
      flash.now[:error] = 'Incorrect password'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have logged out"
  end

end
