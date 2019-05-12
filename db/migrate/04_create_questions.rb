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
    
      t.string :option1
      t.integer :option1_points
    
      t.string :option2
      t.integer :option2_points
    
      t.string :option3
      t.integer :option3_points
    
      t.string :option4
      t.integer :option4_points
    
      t.string :option5
      t.integer :option5_points
    
      t.string :option6
      t.integer :option6_points

      t.timestamps
    end
  end
end
