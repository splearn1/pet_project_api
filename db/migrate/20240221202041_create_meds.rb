class CreateMeds < ActiveRecord::Migration[7.1]
  def change
    create_table :meds do |t|
      t.string :name
      t.integer :dosage
      t.text :description

      t.timestamps
    end
  end
end
