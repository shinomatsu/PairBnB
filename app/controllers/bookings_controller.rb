class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:show,:edit,:update,:destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @listing = Listing.find(params[:listing_id])
    @bookings =@listing.bookings
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
     @listing = Listing.find(params[:listing_id])
  end

  # POST /bookings
  # POST /bookings.json
  def create

    @listing =Listing.find(params[:listing_id])
    @booking = current_user.bookings.new(booking_params)
    @booking.listing_id = @listing.id
    @host = "pairbnbtesttest@gmail.com"
# byebug
      if @booking.save
        ReservationJob.perform_later(current_user.email, @host, @booking.listing.id, @booking.id)
        respond_to do |format|
          format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
          format.json { render :show, status: :ok, location: @booking }
        end
      else
        @errors = @booking.errors
        render "listings/show"
      end
  
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to @booking.user, notice: 'Booking was successfully destroyed.' }
      format.json { render :show, head: :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :no_of_guests)
    end
end
