class Profile < ApplicationRecord
  enum gender: {undisclosed: 0, female: 1, male: 2, other: 3}
  validates :gender, presence: true, inclusion: {in: genders.keys } #numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :weight, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :height, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_date :date_of_birth, presence: true
  belongs_to :user
  

  def self.findit
    Profile.select("gender, height")
          .limit(1)
          .all
  end
end
