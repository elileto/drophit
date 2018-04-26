class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :firstname, presence: true
  validates :lastname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255},
          format: { with: VALID_EMAIL_REGEX},
          uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: {minimum: 8}

  has_one :profile
  has_and_belongs_to_many :workouts

  def self.usersWorkouts(user)
    User.select("workouts.name, workouts.featureImage")
    .joins("INNER JOIN users_workouts ON users_workouts.user_id = users.id")
    .joins("INNER JOIN workouts ON workouts.id = users_workouts.workout_id")
    .where(id: user)
  end

  def self.usersProfiles(user)
    Profile.all
    .where(user_id: user)
  end



end
