class PokemonsController < ApplicationController
  before_action :find_id, only:[:edit, :show, :update, :destroy]

  def index
    @pokemons = Pokemon.all
  end

  def home
    @pokemons = Pokemon.all
  end

  def show
    @bookings = Booking.all

    @pokemons = Pokemon.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @pokemons.geocoded.map do |pokemon|
      {
        lat: pokemon.latitude,
        lng: pokemon.longitude
        # info_window_html: render_to_string(partial: "info_window", locals: {pokemon: @pokemon })
      }
    end
  end


  def new
    @pokemon = Pokemon.new
  end

  def edit
  end

  def update
    if @pokemon.update
      redirect_to pokemons_path(@pokemon)
    else
      render :new,status: :unprocessable_entity
    end
  end

  def create
    @pokemon = Pokemon.new(set_params)
    @pokemon.user_id = current_user.id
    if @pokemon.save
      redirect_to pokemon_path(@pokemon)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @pokemon.delete
    redirect_to pokemons_path
  end


  private

  def set_params
    params.require(:pokemon).permit(:name, :price, :address, photos: [])
  end

  def find_id
    @pokemon = Pokemon.find(params[:id])
  end
end
