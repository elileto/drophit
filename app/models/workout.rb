class Workout < ApplicationRecord
  validates :name, presence: true
  enum method: [:Other, :Yoga, :Hiit, :Cardio, :Strength, :Aerobic]
  validates :method, allow_blank: true, numericality: { only_integer: true }
  validates :featureImage, format: { with: %r{.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image. Cannot be blank.' }
  has_and_belongs_to_many :exercises
  has_and_belongs_to_many :users

  def self.work(workout)
    Workout.select("workouts.name, featureImage")
    .where(id: workout)
  end


  
  def self.listWorkoutsByIntensity
    Workout.select("workouts.name, featureImage, AVG(intensityLevel) as avgIntensity")
    .joins("INNER JOIN exercises_workouts ON workouts.id = exercises_workouts.workout_id")
    .joins("INNER JOIN exercises ON exercises_workouts.exercise_id = exercises.id")
    .group("workouts.name")
  end

  def self.workoutExercises(workout)
    Workout.select("workouts.name AS workoutsname, exercises.name AS exercise, intensityLevel")
    .joins("INNER JOIN exercises_workouts ON workouts.id = exercises_workouts.workout_id")
    .joins("INNER JOIN exercises ON exercises.id = exercises_workouts.exercise_id")
    .where(id: workout)
  end

  def self.averageIntensity(workout)
    Workout.select("workouts.name, workouts.id, AVG(intensityLevel) AS avgIntensity")
    .joins("INNER JOIN exercises_workouts ON workouts.id = exercises_workouts.workout_id")
    .joins("INNER JOIN exercises ON exercises_workouts.exercise_id = exercises.id")
    .where(id: workout)
    .group("workout_id, workouts.name")

  end

  def self.sumTime(workout)
    Workout.select("workouts.name, workouts.id, SUM(hours) AS hours, SUM(minutes) AS minutes, SUM(seconds) AS seconds")
    .joins("INNER JOIN exercises_workouts ON workouts.id = exercises_workouts.workout_id")
    .joins("INNER JOIN exercises ON exercises_workouts.exercise_id = exercises.id")
    .where(id: workout)
    .group("workout_id, workouts.name")
  end
end
