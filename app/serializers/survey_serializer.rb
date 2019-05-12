class SurveySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id
  belongs_to :user
  has_many :questions
end
