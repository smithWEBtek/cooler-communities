require 'nokogiri'
require 'open-uri'

class Question < ApplicationRecord
  belongs_to :category
  belongs_to :survey
  has_many :responses

  def self.build_answer_key(data)
    points_hash = {}
    data.each.with_index(5) do |row, index|
      key = index % 2 == 0 ? index + 1 : index
      answer_key = data[key].downcase.gsub(' / ', '/') unless data[key].nil?
      answer_points = data[key + 1].to_i
      points_hash[answer_key] = answer_points unless answer_key.nil?
    end
    points_hash
  end
  
	def self.import_airtable_cooler_csv
    csv_text = File.read(Rails.root.join('lib', 'assets', 'airtable_cooler.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    points = {}
    answer_key = {}

    csv.each do |row|
      if !row[0].nil?
        question_data = {
          survey_id: 1,
          question_key: row[0],
          airtable_id: row[1],
          category_id: Category.find_or_create_by(title: row[2]).id,
          question_text: row[3],
          question_type: row[4], 
          answer_key: self.build_answer_key(row)
        }
        
        new_question = Question.new(question_data)
        category = new_question.category.title
        question_key = new_question.question_key
        answer_key = new_question.answer_key
        points[question_key] = {} if !points[question_key] || !points[category].nil? 
        points[question_key] = answer_key

        if new_question.save
          puts "question_imported: #{new_question.question_key}"
        else
          raise 'question NOT saved, please check app/lib/assets/airtable_cooler.csv for data accuracy'
        end
        else
      end
    end
    IO.write "app/assets/javascripts/pointsJSON.js", "const pointsJSON = " + JSON.pretty_generate(points)
  end

end
