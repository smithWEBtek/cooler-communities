class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :city, :state, :admin
  has_many :responses
  has_many :questions, through: :responses
  has_many :user_surveys
  has_many :surveys, through: :user_surveys
end
