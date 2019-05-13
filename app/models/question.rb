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
    answer = {
      "#{row[5]}": "#{row[6]}",
      "#{row[7]}": "#{row[8]}",
      "#{row[9]}": "#{row[10]}",
      "#{row[11]}": "#{row[12]}",
      "#{row[13]}": "#{row[14]}",
      "#{row[15]}": "#{row[16]}"
    }

    question_data = {
      survey_id: 1,
      question_key: row[0],
      airtable_id: row[1],
      category_id: Category.find_or_create_by(title: row[2]).id,
      question_text: row[3],
      question_type: row[4], 
      answer_key: answer
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
