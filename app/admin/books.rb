ActiveAdmin.register Book do
  
  permit_params :title, :author, :description, :price, :stock_quantity, :status, :genre_id
  
end
