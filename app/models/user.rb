class User < ActiveRecord::Base
  attr_accessor :password
  
  validates :email, :email => true
  
  before_save :set_crypted_password
  
  def set_crypted_password
    self.crypted_password = BCrypt::Password.create(@password) unless @password.blank?
  end
  
  def crypted_password
    BCrypt::Password.new(read_attribute(:crypted_password))
  end
  
end
