class AddColumnsToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :username, :string
    add_column :customers, :address, :text
    add_column :customers, :city, :string
  end
end
