class ResponseSerializer < ActiveModel::Serializer
  attributes :id, :question_id, :user_id, :answer, :points, :category
  belongs_to :question
  has_one :category, through: :question
  belongs_to :user
end
