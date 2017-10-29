class Listing < ApplicationRecord
	belongs_to :user
	has_many :bookings
	
	mount_uploaders :photos, PhotoUploader

end


 def self.search(search) 
    if search 
      Listing.where(['name LIKE ?', "%#{search}%"])
    else
      Listing.all #全て表示。
    end
  end