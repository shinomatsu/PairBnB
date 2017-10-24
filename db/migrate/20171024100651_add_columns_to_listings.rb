class AddColumnsToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :place_type, :integer
    add_column :listings, :bed_number, :integer
    add_column :listings, :guest_number, :integer
    add_column :listings, :country, :string
    add_column :listings, :state, :string
    add_column :listings, :city, :string
    add_column :listings, :zipcode, :string
    add_column :listings, :address, :string
  end
end
