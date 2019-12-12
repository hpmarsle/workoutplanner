class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :muscle_group
      t.string :length_of_time
      t.integer :weight
      t.integer :sets
      t.integer :reps
      t.string :notes
    end 
  end
end
