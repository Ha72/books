ActiveAdmin.register Order do

  permit_params :order_date, :subtotal, :gst, :pst, :total, :customer_id, :status
  
end
