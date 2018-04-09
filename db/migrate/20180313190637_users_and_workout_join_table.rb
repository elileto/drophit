class UsersAndWorkoutJoinTable < ActiveRecord::Migration[5.1]
    def change
      create_table :users_workouts, id: false do |t|
        t.integer :user_id
        t.integer :workout_id
      end

      add_index :users_workouts, :user_id
      add_index :users_workouts, :workout_id
    end
  end
