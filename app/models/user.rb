class User < ActiveRecord::Base
  has_secure_password
  #TODO uncomment later
  #validates :email, presence: true, uniqueness: true, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, uniqueness: true
  validates :username, presence: true
end
