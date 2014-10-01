class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :institution_id

      t.timestamps
    end
  end
end
