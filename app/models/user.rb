class User < ActiveRecord::Base
  attr_accessor :password
  
  validates :email, :email => true
  
end
