class AddbooleanToListings < ActiveRecord::Migration[5.1]
  def change
  	add_column :listings, :verification, :boolean, default: false, null: false
  end
end


 