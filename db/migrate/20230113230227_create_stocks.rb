class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.integer :profile_id

      t.timestamps
    end
    add_index :stocks, :profile_id
  end
end
