class WelcomeController < ApplicationController

  def index
    @artists = Artist.all(:order => 'name asc')
  end

end
