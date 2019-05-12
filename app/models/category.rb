class Category < ApplicationRecord
  has_many :questions
  has_many :responses, through: :questions
end
