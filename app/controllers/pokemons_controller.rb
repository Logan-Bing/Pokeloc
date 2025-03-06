class PokemonsController < ApplicationController
  before_action :find_id, only:[:edit, :show, :update, :destroy]

  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemons = Pokemon.all
    @markers = @pokemons.geocoded.map do |pokemon|
      if pokemon.id == @pokemon.id
      {
        lat: pokemon.latitude,
        lng: pokemon.longitude
        # info_window_html: render_to_string(partial: "app/views/pages/info_window", locals: { pokemon: pokemon })
      }
    end
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
    redirect_to root_path, status: :see_other

  end

  def search
    @pokemons = Pokemon.all
    tmp = []
    if params[:search]
      @pokemons.each do |pokemon|
        if pokemon.name.match?(params[:search])
          tmp.push(pokemon)
        end
      end
      @pokemons = tmp
    end
  end

  def my_pokemons
    @pokemons = Pokemon.all
    @my_pokemons = @pokemons.select do |pokemon|
      pokemon.user_id == current_user.id
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
