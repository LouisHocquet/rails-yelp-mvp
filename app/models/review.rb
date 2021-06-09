class Review < ApplicationRecord
  belongs_to :restaurant
  validates :rating, :content, presence: true
  validates :rating, numericality: true
  validates :rating, inclusion: (0..5).to_a
end
