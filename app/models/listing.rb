class Listing < ApplicationRecord
	belongs_to :user
	has_many :bookings
	
	mount_uploaders :photos, PhotoUploader
end
