class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :city, :state, :admin
  has_one :survey
  has_many :responses
  has_many :questions, through: :responses
end
