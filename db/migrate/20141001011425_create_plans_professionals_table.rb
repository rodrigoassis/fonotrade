class CreatePlansProfessionalsTable < ActiveRecord::Migration
  def change
    create_table :plans_professionals do |t|
      t.integer :plan_id
      t.integer :professional_id
    end
  end
end
