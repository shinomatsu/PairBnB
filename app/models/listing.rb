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
	 # end

end

# <%= form_tag listings_path, :method => 'get' do |f| %>
#   <%= text_field_tag :search, params[:search] %>
#   <%= submit_tag 'Search', :city => nil %>
# <% end %>

