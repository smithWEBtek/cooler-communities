
## Data Model
User
  t.string :first_name 
  t.string :last_name 
  t.string :password 
  t.string :email (added by Devise migration)
  t.string :city (added by Devise migration)
  t.string :state
  t.boolean :admin, default: false

Survey
  t.string :title
  t.string :description
  t.integer :user_id

  belongs_to :user
  has_many :questions
  has_many :responses, through: :questions

Category 
  t.string :title
  t.text :description

Question 
  t.string :text
  t.integer :category_id
  t.integer :survey_id

  belongs_to :category
  belongs_to :survey
  has_many :responses
  has_many :selections, through: :responses

Response
  t.integer :question_id
  t.text :label
  t.boolean :choice
  t.integer :choice_points
  t.integer :amount
  t.integer :amount_points
  
  belongs_to :question
  has_many :selections
  
Selection
  t.integer :response_id
  t.string :selection_text
  t.integer :selection_points

  belongs_to :response
