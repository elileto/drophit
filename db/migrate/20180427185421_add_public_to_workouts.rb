class AddPublicToWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_column :workouts, :public, :boolean, default: false
  end
end
