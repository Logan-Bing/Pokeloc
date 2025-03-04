class PokemonsController < ApplicationController
  before_action :find_id, only:[:edit, :show, :update, :destroy]
  def index
    @pokemons = Pokemon.all
  end

  def home
    @pokemons = Pokemon.all
  end

  def show
  end

  def new
    @pokemon = Pokemon.new
  end

  def edit
  end

  def create
    @pokemon = Pokemon.new(set_params)
    if @pokemon.save
      redirect_to pokemons_path(@pokemon)
    else
      render :new,status: unprocessable_entity
    end
  end

  def destroy
    @pokemon.delete
    redirect_to pokemons_path
  end


  private

  def set_params
    params.require(:pokemon).permit(:name, :price, :address )
  end

  def find_id
    @pokemon = Pokemon.find(params[:id])
  end
end
