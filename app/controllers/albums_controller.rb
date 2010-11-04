class AlbumsController < ApplicationController

  before_filter :load_album, :only => [:show]
  before_filter :authenticate_user!

  def show
  end

  private

  def load_album
    @album = Album.find(params[:id])
  end

end
