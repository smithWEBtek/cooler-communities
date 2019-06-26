class User < ApplicationRecord
  has_many :responses
  has_many :questions, through: :responses
  has_many :user_surveys
  has_many :surveys, through: :user_surveys
  validates :email, uniqueness: true

end
