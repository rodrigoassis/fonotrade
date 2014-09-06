class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :name
      t.integer :year
      t.string :institute
      t.integer :professional_id

      t.timestamps
    end
  end
end
