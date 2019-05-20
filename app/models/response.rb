class Response < ApplicationRecord
  belongs_to :question
  has_one :category, through: :question
  belongs_to :user

  def self.yard
    self.all.select {|r| r.question.category_id == 1}
  end

  def self.weatherization
    self.all.select {|r| r.question.category_id == 2}
  end

  def self.heating
    self.all.select {|r| r.question.category_id == 3}
  end

  def self.water
    self.all.select {|r| r.question.category_id == 4}
  end

  def self.solar
    self.all.select {|r| r.question.category_id == 5}
  end

  def self.lighting
    self.all.select {|r| r.question.category_id == 6}
  end

  def self.appliances
    self.all.select {|r| r.question.category_id == 7}
  end

  def self.transportation
    self.all.select {|r| r.question.category_id == 8}
  end

  def self.eating
    self.all.select {|r| r.question.category_id == 9}
  end

  def self.recycle
    self.all.select {|r| r.question.category_id == 10}
  end

end
