class AddColumnToBooking < ActiveRecord::Migration[5.1]
  def change
  	add_column :bookings, :pay_status, :boolean, default: false, null: false
  end
end
