class CreatePrescriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :prescriptions do |t|
      t.string :frequency
      t.string :duration
      t.date :date_prescribed
      t.references :pet, null: false, foreign_key: true
      t.references :vet, null: false, foreign_key: true
      t.references :med, null: false, foreign_key: true

      t.timestamps
    end
  end
end
