class CreateProfessionalsSpecialties < ActiveRecord::Migration
  def change
    create_table :professionals_specialties do |t|
      t.integer :specialty_id
      t.integer :professional_id
    end
  end
end
