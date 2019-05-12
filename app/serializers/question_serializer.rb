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
    :option1,
    :option1_points,
    :option2,
    :option2_points,
    :option3,
    :option3_points,
    :option4,
    :option4_points,
    :option5,
    :option5_points,
    :option6,
    :option6_points,
    :option7,
    :option7_points,
    :option8,
    :option8_points,
    :option9,
    :option9_points,
    :option10,
    :option10_points

  belongs_to :category
  belongs_to :survey
  has_many :responses
end
