class BookingsController < ApplicationController
  before_action :find_pokemon, except: [:accept, :decline, :index, :my_bookings]

  def index
    @bookings = Booking.all
  end

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
    @pokemon = @booking.pokemon
    if @booking.save
      redirect_to pokemon_booking_path(@pokemon, @booking)
   else
     render :new, status: :unprocessable_entity
   end
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = false
    @pokemon = @booking.pokemon
    if @booking.save
      redirect_to pokemon_booking_path(@pokemon, @booking)
   else
     render :new, status: :unprocessable_entity
   end
  end

  def my_bookings
    @bookings = Booking.all
    @my_bookings = @bookings.select do |booking|
      booking.user_id == current_user.id
    end
  end

  private

  def set_params
    params.require(:booking).permit(:pokemon_id, :start_date, :end_date)
  end

  def find_pokemon
    @pokemon = Pokemon.find(params[:pokemon_id])
  end
end
