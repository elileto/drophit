class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :sets
      t.integer :repetitions
      t.integer :hours
      t.integer :minutes
      t.integer :seconds
      t.integer :weight
      t.integer :intensityLevel


      t.timestamps
    end
  end
end
