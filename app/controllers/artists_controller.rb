class ArtistsController < ApplicationController

  before_filter :load_artist, :only => [:show]

  def show
  end

  private

  def load_artist
    @artist = Artist.find(params[:id])
  end

end
