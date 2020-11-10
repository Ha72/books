ActiveAdmin.register Book do
  
  permit_params :title, :author, :description, :price, :stock_quantity, :status, :genre_id, :image
  
  form do |f|
      f.semantic_errors
      f.inputs
      f.inputs do
          f.input :image, as: :file
      end
      f.actions
  end
  
end
