class User < ActiveRecord::Base
  has_secure_password
  #TODO uncomment later
  #validates :email, presence: true, uniqueness: true, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, uniqueness: true
  validates :username, presence: true

  has_many :contactings
  has_many :contacts, :through => :contactings
  has_many :inverse_contactings, :class_name => "Contacting", :foreign_key => "contact_id"
  has_many :inverse_contacts, :through => :inverse_contactings, :source => :user

end
