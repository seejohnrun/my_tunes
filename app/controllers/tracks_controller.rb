class TracksController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_track, :only => [:show, :play]

  def show
  end

  def play
    send_file URI.unescape(@track.location.gsub('file://localhost', '')), :type => 'audio/mpeg'
  end

  private

  def load_track
    @track = Track.find(params[:id])
  end

end
