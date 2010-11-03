class WelcomeController < ApplicationController

  def index
    @artists = Artist.not_removed.all(:order => 'name asc')
  end

end
