class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :total_points
  has_many :questions
  has_many :responses, through: :questions
end
