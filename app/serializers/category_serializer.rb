class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :questions
  has_many :responses, through: :questions
end
