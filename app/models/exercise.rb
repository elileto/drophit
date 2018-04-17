class Exercise < ApplicationRecord
  validates :name, presence: true
  validates :sets, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :repetitions, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :hours, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :minutes, numericality: { less_than_or_equal_to: 59,  only_integer: true, greater_than_or_equal_to: 0 }
  validates :seconds, numericality: { less_than_or_equal_to: 59,  only_integer: true, greater_than_or_equal_to: 0 }
  validates :weight, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :intensityLevel, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1, only_integer: true }


end
