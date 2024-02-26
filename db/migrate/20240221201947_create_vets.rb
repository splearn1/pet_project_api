class CreateVets < ActiveRecord::Migration[7.1]
  def change
    create_table :vets do |t|
      t.string :name
      t.string :email
      t.integer :phone

      t.timestamps
    end
  end
end
