require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :images
  
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"
  validates_uniqueness_of :email, :on => :create, :message => "must be unique"
  
  attr_accessor :password_confirmation 
  validates_confirmation_of :password
  
  validate :password_non_blank
  
  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end

  def password
    @password
  end
  
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end
  
  def after_destroy
    if User.count.zero?
      raise "Can't delete last user"
    end
  end
  
  # def self.update_user(params, salt)
  #   user = {}
  #   unless params[:password_confirmation].blank?
  #     hashed_confirmation_password = User.encrypted_password(params[:password_confirmation],salt) 
  #     user[:email] = params[:email]
  #     user[:hashed_password] = hashed_confirmation_password
  #     user[:salt] = salt
  #   end
  #   return user
  # end

  
private
  def password_non_blank
    errors.add(:password, "Missing Password") if hashed_password.blank?
  end
  
  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
  
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  
  
end
