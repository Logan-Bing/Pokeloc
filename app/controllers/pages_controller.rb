class PagesController < ApplicationController
  def home
    @pokemons = Pokemon.all
    @markers = @pokemons.geocoded.map do |pokemon|
      {
        lat: pokemon.latitude,
        lng: pokemon.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {pokemon: pokemon })
      }
    end
  end

  def show
    @pokemon = Pokemon.find(params(:id))
  end
end
