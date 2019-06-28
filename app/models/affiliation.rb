class Affiliation < ApplicationRecord
  has_many :users

  def self.import_affiliations_csv
    csv_text = File.read(Rails.root.join('lib', 'assets', 'affiliations.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
   
    csv.each do |row|
      a = Affiliation.new(name: row[0])
      if a.save
        puts "affiliation: #{a.name} created"
      else 
        puts "affiliation not saved, check csv file:  lib/assets/affiliations.csv"
      end
    end
  end
end
