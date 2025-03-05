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
    if @pokemon.update(set_params)
      redirect_to pokemon_path(@pokemon)
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
    @pokemon.destroy
    redirect_to pokemons_path, status: :see_other
  end

  def search
    @pokemons = Pokemon.all
    tmp = []
    if params[:search].downcase
      @pokemons.each do |pokemon|
        if pokemon.name.downcase.match?(params[:search])
          tmp.push(pokemon)
        end
      end
      @pokemons = tmp
    end
  end

  private

  def set_params
    params.require(:pokemon).permit(:name, :price, :address, :photo)
  end

  def find_id
    @pokemon = Pokemon.find(params[:id])
  end
end
