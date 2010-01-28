class Post < ActiveRecord::Base
  def to_param
    "#{id}-#{title.parameterize}"
  end
  
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  
  attr_writer :tag_names
  
  def tag_names
    @tag_names || tags.collect(&:name) * " "
  end
  
  def save_tags
    return unless @tag_names
    self.tags = @tag_names.scan(/\S+/).uniq.collect do |tag_name|
      Tag.find_or_initialize_by_name tag_name
    end
  end
  
  after_save :save_tags
  
  def set_archive_month
    self.archive_month = (created_at || Time.now).beginning_of_month
  end
  
  before_create :set_archive_month
  
  
end
