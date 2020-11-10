class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.decimal :price
      t.integer :stock_quantity
      t.string :status

      t.timestamps
    end
  end
end
