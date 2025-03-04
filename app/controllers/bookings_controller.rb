class BookingsController < ApplicationController
  before_action :find_pokemon

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(set_params)
    @booking.pokemon = @pokemon
    @booking.user_id = current_user.id
    @booking.status = nil

      if @booking.save
         redirect_to pokemon_booking_path(@pokemon, @booking)
      else
        render :new, status: :unprocessable_entity
      end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = true
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = false
  end

  private

  def set_params
    params.require(:booking).permit(:pokemon_id, :start_date, :end_date)
  end

  def find_pokemon
    @pokemon = Pokemon.find(params[:pokemon_id])
  end
end
