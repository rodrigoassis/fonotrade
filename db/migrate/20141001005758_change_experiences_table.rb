class ChangeExperiencesTable < ActiveRecord::Migration
  def change
    remove_column :experiences, :name
    remove_column :experiences, :institute
    add_column :experiences, :course_id, :integer
    add_column :experiences, :comments, :text
  end
end
