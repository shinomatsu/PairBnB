class AddDetailsToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :title, :string
    add_column :listings, :description, :text
    add_column :listings, :room_type, :string
    add_column :listings, :price, :integer
    add_column :listings, :house_rules, :text
  end
end
