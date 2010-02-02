class WeblogsController < ApplicationController
  skip_before_filter :load_weblog
  
  def new
    @weblog = Weblog.new
    @user = User.new
  end
  
  def create
    @weblog = Weblog.new(params[:weblog])
    @user = User.new(params[:user])
    if @weblog.valid? && @user.valid?
      @weblog.save
      @user.save 
      redirect_to new_post_path
    else
      render 'new'
    end
  end
end
