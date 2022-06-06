class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :date_of_rejection
      t.string :plu
      t.string :quantity
      t.string :type_of_quantity
    end
  end
end
