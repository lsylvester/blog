class User < ActiveRecord::Base
  attr_accessor :password
  
  validates :email, email: true
  validate :password, presence: true, allow_nil: true
  before_save :set_crypted_password
  
  def set_crypted_password
    self.crypted_password = BCrypt::Password.create(@password) unless @password.blank?
  end
  
  def crypted_password
    BCrypt::Password.new(read_attribute(:crypted_password))
  end
  
  def set_access_token
    self.access_token = SecureRandom.base64(16).tr('+/=', '-_ ').strip.delete("\n")
  end
  
  def clear_access_token
    self.access_token = nil
  end
  
  before_create :set_access_token, :unless => :password
  before_update :clear_access_token
end
