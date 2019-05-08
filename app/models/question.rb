class Question < ApplicationRecord
  belongs_to :category
  belongs_to :survey
  has_many :responses
  has_many :selections, through: :responses
end
