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
