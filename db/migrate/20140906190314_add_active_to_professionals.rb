class AddActiveToProfessionals < ActiveRecord::Migration
  def change
    add_column :professionals, :active, :boolean, default: false
  end
end
