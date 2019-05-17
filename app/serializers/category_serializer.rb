class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :questions
  has_many :responses, through: :questions
end
