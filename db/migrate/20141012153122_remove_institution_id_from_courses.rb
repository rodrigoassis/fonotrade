class RemoveInstitutionIdFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :institution_id
  end
end
