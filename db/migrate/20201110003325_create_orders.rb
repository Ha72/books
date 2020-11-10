class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.decimal :subtotal
      t.decimal :gst
      t.decimal :pst
      t.decimal :total

      t.timestamps
    end
  end
end
