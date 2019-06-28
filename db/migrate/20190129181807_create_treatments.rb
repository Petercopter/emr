class CreateTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :treatments do |t|
      t.string :description
      t.string :necessity
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
