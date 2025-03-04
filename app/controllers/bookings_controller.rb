class BookingsController < ApplicationController
  before_action :find_pokemon

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.pokemon = @pokemon
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :enprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def set_params
    params.require(:bookings).permit(:pokemon_id)
  end

  def find_pokemon
    @pokemon = Pokemon.find(params[:pokemon_id])
  end
end
