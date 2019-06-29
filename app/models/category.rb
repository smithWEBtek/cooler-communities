class Category < ApplicationRecord
  has_many :questions
  has_many :responses, through: :questions

  def total_points
    points = 0
    self.responses.each {|r| points += r.points.to_i}
    points
  end
end
