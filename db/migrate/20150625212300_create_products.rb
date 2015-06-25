class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.integer :inventory

      t.timestamps null: false
    end
  end
end
