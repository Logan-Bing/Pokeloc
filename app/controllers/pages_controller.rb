class PagesController < ApplicationController
  def home
    if params[:query].present?
      @pokemons = Pokemon.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @pokemons = Pokemon.all
    end
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
