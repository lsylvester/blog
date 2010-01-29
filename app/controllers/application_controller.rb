class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def admin?
    session[:admin]
  end
  
  helper_method :admin?
  
  def require_admin
    redirect_to root_path, alert: "Not Authorized" unless admin?
  end
  
  def load_tags
    @tags = Tag.select("tags.*, count(posts.id) as posts_count").joins(:posts).group('tags.id')
  end
  
  def load_archives
    @archives = Archive.all
  end
  
  before_filter :load_tags, :load_archives
  
  def load_weblog
    @weblog = Weblog.first
    redirect_to new_weblog_path unless @weblog
  end
  
  before_filter :load_weblog
end
