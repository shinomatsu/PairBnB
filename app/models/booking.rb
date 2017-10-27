class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :listing
	validate :check_overlapping
	#validate :check_max_guests

	def check_overlapping
		listing.bookings.each  do |old_booking|
			if overlap?(self,old_booking)
		    	errors.add(:overlapping_dates, "The booking dates confrict")
		    	break
		    end
	      end
	end

	def overlap?(x,y)
		(x.start_date - y.end_date) * (y.start_date - x.end_date) > 0
	end

	# def check_max_guests
	# 	max_guests = listing.guest_number
	# 	return if   num_guests < max_guests
	# 	errors.add(:max_guests, "Max guests number exceeded")
	#     end
	end


	


