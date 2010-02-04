class UsersController < ApplicationController
  before_filter :require_admin, except: [:edit, :update]
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.all
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      ActionMailer::Base.default_url_options[:host] = request.host_with_port
      Notifier.invitation(@user).deliver
      redirect_to @user, notice: "User was created"
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    if admin?
      @current_user = User.find(session[:user_id]) 
      @user = User.find(params[:id])
    else
      @current_user = @user = User.find_by_access_token!(params[:id])
    end
  end
  
  def update
    @user = admin? ? User.find(params[:id]) : User.find_by_access_token!(params[:id])
    if @user.update_attributes(params[:user])
      session[:user_id] = @user.id unless admin?
      redirect_to @user, notice: "User was updated"
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
