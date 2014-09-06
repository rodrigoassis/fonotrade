class CreateProfessionals < ActiveRecord::Migration
  def change
    create_table :professionals do |t|
      t.string :name
      t.string :cpf
      t.string :phone
      t.string :email
      t.string :crfa
      t.string :cep
      t.string :state
      t.string :city
      t.string :address
      t.string :complement
      t.string :neighborhood

      t.timestamps
    end
  end
end
