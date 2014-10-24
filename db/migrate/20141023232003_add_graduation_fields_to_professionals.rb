class AddGraduationFieldsToProfessionals < ActiveRecord::Migration
  def change
    add_column :professionals, :graduation_institution_id, :integer
    add_index :professionals, :graduation_institution_id
    add_column :professionals, :graduation_course_id, :integer
    add_index :professionals, :graduation_course_id
    add_column :professionals, :graduation_year, :integer
  end
end
