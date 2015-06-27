class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.integer :inventory, default: 10

      t.timestamps null: false
    end
  end
end
