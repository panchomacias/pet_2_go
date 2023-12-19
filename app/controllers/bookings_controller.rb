class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
  end

  def new
    #desde el show de offers
    @bookings = current_user.bookings
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
    @booking.status = true
    @booking.user = current_user
    @booking.offer = @offer
    if @booking.save
      redirect_to offer_bookings_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to bookings_path, notice: 'Booking was successfully destroyed.'
    else
      redirect_tp booking_path, alert: 'Failed to destroy booking.'
    end 
  end

  private

  def booking_params
    params.require(:booking).permit(:date_to, :date_from)
  end

end
