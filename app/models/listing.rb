class Listing < ApplicationRecord
	# include ActiveModel::Model

	belongs_to :user
	has_many :bookings
	# , many to one booking.listing
	
	mount_uploaders :photos, PhotoUploader
	validates :city,presence: true

	# default_scope { order("updated_at DESC")}
	# default_scope :by_newest
	 # def self.search(search) 
	 #    if search 
	 #      where(['city LIKE ?', "%#{search}%"])
	 #    else
	 #      all #全て表示。
	 #    end
	 # # end
	 #   def self.search(search) #ここでのself.はUser.を意味する
		#     if search
		#       where(['country LIKE ?', "%#{search}%"])
		#     else
		#       all #全て表示。User.は省略
		#     end
  #      end

       scope :search_with_country, -> (country){ where("country like ?", "%#{country}%")}
       scope :search_with_numeber, -> (guest_number) { where("guest_number >= ?", guest_number)if guest_number.present? }



end

# <%= form_tag listings_path, :method => 'get' do |f| %>
#   <%= text_field_tag :search, params[:search] %>
#   <%= submit_tag 'Search', :city => nil %>
# <% end %>

