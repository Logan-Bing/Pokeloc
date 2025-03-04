class PagesController < ApplicationController
  def home
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params(:id))
  end
end
