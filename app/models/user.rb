class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, user_password) 
    user = User.where("email = ?", email).first

    if user && user.password == user_password
      user
    else
      nil  
    end
  end

end
