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
    question_data = {
      survey_id: 1,
      question_key: row[0],
      airtable_id: row[1],
      category_id: Category.find_or_create_by(title: row[2]).id,
      question_text: row[3],
      question_type: row[4],
      option1: row[5],
      option1_points: row[6],

      option2: row[7],
      option2_points: row[8],

      option3: row[9],
      option3_points: row[10],

      option4: row[11],
      option4_points: row[12],

      option5: row[13],
      option5_points: row[14],

      option6: row[15],
      option6_points: row[16]
    }
    
    new_question = Question.new(question_data)
      if new_question.save
        puts "."
      else
        raise 'question NOT saved, please check airtable-cooler.csv for data accuracy'
      end
    end
  end
end
