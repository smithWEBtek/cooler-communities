class UserSerializer < ActiveModel::Serializer
  attributes :id, :admin, :username, :first_name, :last_name, :email, :address, :city, :state, :zipcode, :phone, :affiliation

  has_many :responses
  has_many :questions, through: :responses
  has_many :user_surveys
  has_many :surveys, through: :user_surveys
  belongs_to :affiliation
end
