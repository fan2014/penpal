class User < ActiveRecord::Base
  has_secure_password  
  validates :name, presence: true, length: { maximum: 20 }
  validates :password, presence: true, length: { minimum: 8 }
end
