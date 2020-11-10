class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :username
      t.text :password
      t.string :name
      t.string :phone
      t.text :address

      t.timestamps
    end
  end
end
