class AlbumsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_album, :only => [:show]

  def show
  end

  private

  def load_album
    @album = Album.find(params[:id])
  end

end
