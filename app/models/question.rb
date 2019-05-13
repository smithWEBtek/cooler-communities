require 'nokogiri'
require 'open-uri'

class Question < ApplicationRecord
  belongs_to :category
  belongs_to :survey
  has_many :responses

  def self.build_answer_key(data)
    answer_key = {}
    data.each.with_index(5) do |row, index|
      key = index % 2 == 0 ? index + 1 : index
      question = data[key].nil? ? "blank" : data[key]
      # points = data[key + 1].to_i || data[1].to_i
      points = index * data[1].to_i
      answer_key[question] = points
    end
    answer_key
  end
  
	def self.import #import airtable_cooler.csv
    csv_text = File.read(Rails.root.join('lib', 'assets', 'airtable_cooler.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    points = {}

    csv.each do |row|
      question_data = {
        survey_id: 1,
        question_key: row[0],
        airtable_id: row[1],
        category_id: Category.find_or_create_by(title: row[2]).id,
        question_text: row[3],
        question_type: row[4], 
        answer_key: self.build_answer_key(row)
      }
      points[row[0]] = self.build_answer_key(row)
      new_question = Question.new(question_data)
      
      if new_question.save
        puts "."
      else
        raise 'question NOT saved, please check airtable-cooler.csv for data accuracy'
      end
    end
    self.clean_points(points)
  end
  
  def self.clean_points(points)
    points_hash = {}
    question_keys = points.keys
    question_keys.each do |qkey|
      points_hash[qkey] = {}
      answer_keys = points[qkey].keys
        answer_keys.each do |akey|
          points_hash[qkey][akey.downcase] = points[qkey][akey]
        end
      end      
      IO.write "public/assets/json/points.json", JSON.pretty_generate(points_hash)
    end
end
