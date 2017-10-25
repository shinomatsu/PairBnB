class Listing < ApplicationRecord
	belongs_to :user
	mount_uploader :photos, PhotoUploader
end
