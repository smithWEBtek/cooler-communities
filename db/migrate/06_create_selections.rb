class CreateSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :selections do |t|
      t.integer :response_id
      t.string :selection_text
      t.integer :selection_points
      
      t.timestamps
    end
  end
end
