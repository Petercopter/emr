class CreateDiagnoses < ActiveRecord::Migration[5.2]
  def change
    create_table :diagnoses do |t|
      t.string :coding_system
      t.string :code
      t.string :description
      t.references :diagnoseable, polymorphic: true

      t.timestamps
    end
  end
end
