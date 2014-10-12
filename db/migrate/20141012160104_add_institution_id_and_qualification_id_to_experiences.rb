class AddInstitutionIdAndQualificationIdToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :institution_id, :integer
    add_index :experiences, :institution_id
    add_column :experiences, :qualification_id, :integer
    add_index :experiences, :qualification_id
  end
end
