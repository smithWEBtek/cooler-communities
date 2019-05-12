require 'nokogiri'
require 'open-uri'

class Question < ApplicationRecord
  belongs_to :category
  belongs_to :survey
  has_many :responses

	def self.import #import airtable_cooler.csv
    csv_text = File.read(Rails.root.join('lib', 'assets', 'airtable_cooler.csv'))
   csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
   
   csv.each do |row|
     binding.pry
    #  row[0] = #Question key
    #  row["Question ID"]
    #  row["Question Text"]
    #  row["Category"]

     # Question,Question ID,Category,Question Text,Question Type,Responce Option 1,Responce Option 1 Points,Responce Option 2,Responce Option 2 Points,Responce Option 3,Responce Option 3 Points,Responce Option 4,Responce Option 4 Points,Responce Option 5,Responce Option 5 Points,Responce Option 6,Responce Option 6 Points

  #  id: nil,
  #  survey_id: nil,
  #  question_key: nil,
  #  airtable_id: nil,
  #  category_id: nil,
  #  question_text: nil,
  #  question_type: nil,
  #  survey_logic_type: nil,
  #  conditional_parent_question_id: nil,
  #  option1: nil,
  #  option1_points: nil,
  #  option2: nil,
  #  option2_points: nil,
  #  option3: nil,
  #  option3_points: nil,
  #  option4: nil,
  #  option4_points: nil,
  #  option5: nil,
  #  option5_points: nil,
  #  option6: nil,
  #  option6_points: nil,
  #  option7: nil,
  #  option7_points: nil,
  #  option8: nil,
  #  option8_points: nil,
  #  option9: nil,
  #  option9_points: nil,
  #  option10: nil,
  #  option10_points: nil,
  #  created_at: nil,
  #  updated_at: nil>

    end
  end
end
