class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :survey_id
      t.string :question_key
      t.string :airtable_id
      t.integer :category_id
      t.string :question_text
      t.string :question_type
      t.string :survey_logic_type
      t.integer :conditional_parent_question_id
      t.json :answer_key, default: {}
      t.timestamps
    end
  end
end
