class AddDiscriptionAndTimestampsToProducts < ActiveRecord::Migration[7.0]
  def change
    change_table :products do |t|
      t.string :description 
      t.string :production_date
      t.string :expiration_date_type
      t.string :expiration_date
    end
  end
end
