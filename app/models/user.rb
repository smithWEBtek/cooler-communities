require 'csv'

class User < ApplicationRecord
  validates :username, uniqueness: true
  has_secure_password
  has_many :responses
  has_many :questions, through: :responses
  has_many :user_surveys
  has_many :surveys, through: :user_surveys
  belongs_to :affiliation

  def password=(new_password)
    salt = BCrypt::Engine::generate_salt
    hashed = BCrypt::Engine::hash_secret(new_password, salt)
    self.password_digest = salt + hashed
  end

  def authenticate(password)
    salt = password_digest[0..28]
    hashed = BCrypt::Engine::hash_secret(password, salt)
    (salt + hashed) == self.password_digest
  end

  def admin?
    self.admin
  end

  def summary
    puts "******************************************"
    puts "create report of all points for this user"
    puts "******************************************"
  end

  def affiliation_name
    self.affiliation.name
  end

  def self.to_csv
    attributes = ["username",
      "first_name",
      "last_name",
      "email",
      "phone",
      "address",
      "city",
      "state",
      "zipcode",
      "admin",
      "affiliation_name"]

    file = CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        # csv << user.attributes.values_at(*attributes)
        csv << attributes.map{|attr| user.send(attr)}
      end
    end
  end

  def self.import_users_csv
    csv_text = File.read(Rails.root.join('lib', 'assets', 'users.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    csv.each do |row|
      a = User.new
      a.username = row[0]
      a.first_name = row[1]
      a.last_name = row[2]
      a.email = row[3]
      a.password = row[4]
      a.phone = row[5]
      a.address = row[6]
      a.city = row[7]
      a.state = row[8]
      a.zipcode = row[9]
      a.admin = row[10]
      a.affiliation = Affiliation.find_by_name(row[11])

      if a.save
        puts "user: #{a.username} created"
      else 
        puts "user not saved, check csv file:  lib/assets/users.csv"
      end
    end
  end
end
