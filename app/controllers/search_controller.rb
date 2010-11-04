class SearchController < ApplicationController

  def index
    unless params[:query]
      return false
    end
    query = "%#{params[:query].gsub(/\s/, '%')}%"
    @albums = Album.like(query)
    @tracks = Track.like(query) 
    @artists = Artist.like(query)
  end

end
