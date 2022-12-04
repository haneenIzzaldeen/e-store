class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.date :production_date
      t.date :expiration_date
      t.integer :stock_quantity

      t.timestamps
    end
  end
end
