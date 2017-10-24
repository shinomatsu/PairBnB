class ListingsController < ApplicationController
	before_action :set_listing, only:[:show, :edit, :update, :destroy]
	before_action :require_login, only: [:show,:edit,:update,destroy]


  #get /listings
  def index
  end

  #get /listings/:listing_id
  def show
  end

  def create
  end

  def edit
  end

  def update
  	
  end

  def destroy
  end
  

  private
	def set_listing
		@listing = Listing.find(params[:id])


	end

	def user_params
		params.require(:listing).permit(:user,:title,:num_of_rooms,:description,:room_type,:price,:house_rules)

	end

end
