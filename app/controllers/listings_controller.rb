class ListingsController < ApplicationController
  #sort_helper
  helper_method :sort_column, :sort_direction

	before_action :set_listing, only:[:show, :edit, :update, :destroy, :verify]
	before_action :require_login, only: [:edit,:update,:destroy]


  #get /listings
  def index
    @q = Listing.ransack(params[:q])

  	@listings = Listing.all.order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 15)
    # @users = User.all.order(:id)
  	# render :"index",layout:true

  end

  #get search
  def search
    @q = Listing.ransack(params[:q])
    @listings = Listing.where(city: params[:q][:city])
    @listings = @listings.order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 15)

    render :index
  end


  #get /listings/:listing_id
  def show
    @booking = Booking.new
  end

  def new
    @listing = Listing.new
    # authorization code

  end

  def create
   # byebug
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
    # byebug
    if @listing.update(listing_params)
      redirect_to @listing
    else
      render :edit
    end
  	
  end

  def destroy
    if @listing.destroy
      redirect_to "/listings"
    else
    end

  end

  def verify

       if current_user.customer?
        flash[:notice] = "Sorry. You do not have the permissino to verify a property."
        redirect_to '/'
       else 


        @listing.update(verification: true)
        @listing.save
        flash[:notice] = "Property has been verified."
        redirect_to '/'
      # end authorization code

      # other code to make the new action work!
       end
  end
  

  private
	def set_listing
		@listing = Listing.find(params[:id])

	end

	def listing_params
		params.require(:listing).permit(:title,:num_of_rooms,:description,:room_type,:price,:house_rules,:bed_number,:guest_number,:country,:state,:city,:zipcode,:address,photos: [])

	end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
 
  def sort_column
      Listing.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def search_params
    params.require(:q).permit(:city_eq)
  end

end
