
## Data Model
User
  t.string :first_name 
  t.string :last_name 
  t.string :password 
  t.string :city
  t.string :state
  t.boolean :admin, default: false

  t.string :email
  t.string :password_digest (added by Bcrypt)

  has_many :responses
  has_many :questions, through: :responses
  has_many :user_surveys
  has_many :surveys, through: :user_surveys
  validates :email, uniqueness: true

Survey
  t.string :title
  t.string :description

  has_many :questions
  has_many :responses, through: :questions
  has_many :user_surveys
  has_many :users, through: :user_surveys

UserSurvey
  t.integer :user_id
  t.integer :survey_id

  belongs_to :user
  belongs_to :survey
  
Category 
  t.string :title
  
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
  t.json :answer_key, default: {}
  t.timestamps

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
