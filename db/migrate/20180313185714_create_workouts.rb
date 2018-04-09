class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.string  :name
      t.string :featureImage
      t.timestamps
    end
  end
end
