class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.integer :num_of_rooms
      
      t.references :user
      t.integer :user_id

      t.timestamps
    end
  end
end

    # add_column :listings, :title, :string
    # add_column :listings, :description, :text
    # add_column :listings, :room_type, :string
    # add_column :listings, :price, :integer
    # add_column :listings, :house_rules, :text

# a = Listing.create(title:"the nice guest room",num_of_rooms:5,user:"a",user_id:3,description:"it has nice guset room.",room_type:"single",price:1000,house_rules:"no pets")
