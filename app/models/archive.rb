class Archive < ActiveRecord::Base
  set_table_name :posts
  
  # Note: can't use a relation here. Not sure if I am meant ot be able to.
  default_scope select: "archive_month, count(id) as posts_count", group: "archive_month"
  
  def label
    archive_month.strftime("%B %y")
  end
  
  def month
    archive_month.strftime("%m")
  end
  
  def year
    archive_month.strftime("%Y")
  end
  
  def initialize year, month
    super(archive_month: Time.utc(year, month))
  end
  
  def posts
    Post.where(archive_month: archive_month)
  end
end