class Category < ApplicationRecord
  has_many :questions
  has_many :responses, through: :questions

  def total_points
    points = 0
    self.responses.each {|r| points += r.points.to_i}
    points
  end

  def self.create_surveyjs_category_names
    # loop through surveyJSON
    # match page.title with self.name
    # maybe change Category.name to title, so things match easier

    # if surveyJSON.page.title = category.name
      # category.surveyjs_category_name = surveyJSON.page.name
  end
end
