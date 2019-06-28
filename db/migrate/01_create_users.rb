class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username 
      t.string :password_digest
      t.string :first_name 
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :affiliation_id, default: 1
      t.boolean :admin, false
      t.timestamps
    end
  end
end
