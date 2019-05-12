class UserSurveySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :survey_id
  belongs_to :user
  belongs_to :survey
end
