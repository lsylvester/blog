class Post < ActiveRecord::Base
  def to_param
    "#{id}-#{title.parameterize}"
  end
  
  has_many :taggings
  has_many :tags, through: :taggings
  
  attr_writer :tag_names
  
  def tag_names
    @tag_names || tags.collect(&:name) * " "
  end
  
  def save_tags
    self.tags = @tag_names.scan(/\S+/).collect do |tag_name|
      Tag.find_or_initialize_by_name tag_name
    end
  end
  
  after_save :save_tags
end
