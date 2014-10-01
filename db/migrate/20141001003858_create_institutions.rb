class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
