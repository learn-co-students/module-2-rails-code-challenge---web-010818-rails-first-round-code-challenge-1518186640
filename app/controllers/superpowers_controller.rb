class SuperpowersController < ApplicationController
  def index
    @superpowers = Superpower.all
  end

  def show
    @superpower=Superpower.find_by(params[:id])
  end

end
