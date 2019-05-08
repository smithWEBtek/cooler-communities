class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :question_id
      t.text :label
      t.boolean :choice
      t.integer :choice_points
      t.integer :amount
      t.integer :amount_points
      
      t.timestamps
    end
  end
end
