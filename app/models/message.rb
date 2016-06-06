class Message < ActiveRecord::Base
  validates :target_email, presence: true
  belongs_to :user
end
