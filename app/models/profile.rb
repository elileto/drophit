class Profile < ApplicationRecord
  enum gender: [:undisclosed, :female, :male, :other]
  validates :gender, presence: true, numericality: { only_integer: true }
  validates :weight, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :height, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_date :date_of_birth, presence: true, :on_or_before => lambda { Date.current }
  belongs_to :user

  def self.findit
    Profile.select("gender, height")
          .limit(1)
          .all
  end
end
