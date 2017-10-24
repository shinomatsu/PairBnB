class ListingsController < ApplicationController
	before_action :set_listing, only:[:show, :edit, :update, :destroy]
	before_action :require_login, only: [:show,:edit,:update,:destroy]


  #get /listings
  def index
  	@listings = Listing.all
  	# render :"index",layout:true
  end

  #get /listings/:listing_id
  def show
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to listings_path
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to listing_path
    else
      render :edit
    end
  	
  end

  def destroy
  end
  

  private
	def set_listing
		@listing = Listing.find(params[:id])


	end

	def listing_params
		params.require(:listing).permit(:user,:title,:num_of_rooms,:description,:room_type,:price,:house_rules)

	end

end
