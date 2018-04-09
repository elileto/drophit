class Exercise < ApplicationRecord
  validates :name, presence: true
  validates :sets, numericality: { only_integer: true }
  validates :repetitions, numericality: { only_integer: true }
  validates :hours, numericality: { only_integer: true }
  validates :minutes, numericality: { less_than_or_equal_to: 59,  only_integer: true }
  validates :seconds, numericality: { less_than_or_equal_to: 59,  only_integer: true }
  validates :weight, numericality: { only_integer: true }
  validates :intensityLevel, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1, only_integer: true }


end
