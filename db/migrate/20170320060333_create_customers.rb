class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.date :dob
      t.string :building
      t.string :subarea
      t.string :locality
      t.integer :pin
      t.string :emailid
      t.integer :mobileno
      t.string :bg
      t.string :diseases
      t.string :medicin
      t.string :allergy
      t.belongs_to :tenant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
