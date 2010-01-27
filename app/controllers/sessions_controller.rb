class SessionsController < ApplicationController
  def new
  end
  
  def create
    if params[:session][:password] == 'secret'
      session[:admin] = true
      redirect_to root_path, notice: "You have logged in"
    else
      flash.now[:error] = 'Incorrect password'
      render 'new'
    end
  end
  
  def destroy
    session[:admin] = nil
    redirect_to root_path, notice: "You have logged out"
  end

end
