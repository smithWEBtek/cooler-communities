class QuestionSerializer < ActiveModel::Serializer
  attributes :id,
    :survey_id,
    :question_key,
    :airtable_id,
    :category_id,
    :question_text,
    :question_type,
    :survey_logic_type,
    :conditional_parent_question_id,
    :answer_key

  belongs_to :category
  belongs_to :survey
  has_many :responses
end
