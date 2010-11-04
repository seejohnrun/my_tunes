class WelcomeController < ApplicationController

  before_filter :authenticate_user!

  def index
    @artists = Artist.all(:order => 'name asc')
  end

end
