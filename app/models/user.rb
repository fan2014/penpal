class User < ActiveRecord::Base
  
  before_create :create_remember_token
  
  has_secure_password  
  validates :name, presence: true, length: { maximum: 20 }
  validates :password, presence: true, length: { minimum: 8 }
  
  has_many :mails
  
  
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end 
  
  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
