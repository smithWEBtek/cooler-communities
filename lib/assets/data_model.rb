
## Data Model
User
  t.string :first_name 
  t.string :last_name 
  t.string :password 
  t.string :email (added by Devise migration)
  t.string :city (added by Devise migration)
  t.string :state
  t.boolean :admin, default: false

  has_one :survey
  has_many :responses
  has_many :questions, through: :responses
  validates :email, uniqueness: true

Survey
  t.string :title
  t.string :description
  t.integer :user_id

  belongs_to :user
  has_many :questions

Category 
  t.string :title
  t.text :description
  
  has_many :questions
  has_many :responses, through: :questions

Question 
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

  t.string :option7
  t.integer :option7_points

  t.string :option8
  t.integer :option8_points

  t.string :option9
  t.integer :option9_points

  t.string :option10
  t.integer :option10_points

  belongs_to :category
  belongs_to :survey
  has_many :responses

Response
  t.integer :question_id
  t.integer :user_id
  t.text :answer
  t.integer :points
  
  belongs_to :question
  belongs_to :user
