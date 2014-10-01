class RemoveProfessionalIdFromPlans < ActiveRecord::Migration
  def change
    remove_column :plans, :professional_id
  end
end
