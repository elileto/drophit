class AddTypeToWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_column(:workouts, :method, :integer)
  end
end
