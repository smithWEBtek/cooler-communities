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


    end
  end
end
