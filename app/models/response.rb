class Response < ApplicationRecord
  belongs_to :question
  has_many :selections
end
