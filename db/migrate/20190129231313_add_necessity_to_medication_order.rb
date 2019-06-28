class AddNecessityToMedicationOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :medication_orders, :necessity, :string
  end
end
