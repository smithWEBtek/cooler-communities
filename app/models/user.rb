require 'csv'

class User < ApplicationRecord
  validates :username, uniqueness: true
  has_secure_password
  has_many :responses
  has_many :questions, through: :responses
  has_many :user_surveys
  has_many :surveys, through: :user_surveys
  belongs_to :affiliation
  belongs_to :state, optional: true

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

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def reset_password
    self.update(password: "password")
  end

  def state_abbr
    self.state.code
  end

  def self.to_csv
    attributes = ["username",
      "first_name",
      "last_name",
      "email",
      "phone",
      "address",
      "city",
      "state_abbr",
      "zipcode",
      "admin",
      "affiliation_name"]

    file = CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        # csv << user.attributes.values_at(*attributes) #alternate way
        csv << attributes.map{|attr| user.send(attr)}
      end
    end
  end

  def user_to_csv
    attributes = ["username",
      "first_name",
      "last_name",
      "email",
      "phone",
      "address",
      "city",
      "state_abbr",
      "zipcode",
      "admin",
      "affiliation_name"]

    file = CSV.generate(headers: true) do |csv|
      csv << self.attributes.values_at(*attributes)
      # csv << attributes.map{|attr| user.send(attr)} #alternate way
    end
  end

  def self.import_users_csv
    csv_text = File.read(Rails.root.join('lib', 'assets', 'users.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    csv.each do |row|
      user = User.new
      user.username = row[0]
      user.first_name = row[1]
      user.last_name = row[2]
      user.email = row[3]
      user.password = row[4]
      user.phone = row[5]
      user.address = row[6]
      user.city = row[7]
      user.state = State.find_by_code(row[8]) if !row[8].nil?
      user.zipcode = row[9]
      user.admin = row[10]
      user.affiliation = Affiliation.find_by_name(row[11])

      if user.save
        puts "user: #{user.username} created"
      else
        puts "user not saved, check csv file:  lib/assets/users.csv"
      end
    end
  end

  def total_points
    points = 0
    self.responses.each {|r| points += r.points if r.points }
    points
  end
  
  def summary
    puts "******************************************"
    puts "create report of all points for this user"
    puts "******************************************"
  end

  def affiliation_name
    self.affiliation.name
  end

end
