class ResponseSerializer < ActiveModel::Serializer
  attributes :id, :question_id, :user_id, :answer, :points
  belongs_to :question
  belongs_to :user
end
