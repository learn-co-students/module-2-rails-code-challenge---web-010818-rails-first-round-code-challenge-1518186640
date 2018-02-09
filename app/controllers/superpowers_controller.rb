class SuperpowersController < ApplicationController
  def index
    @superpowers = Superpower.all
  end

  def show
    @superpower = Superpower.find(params[:id])
  end

  def search
    @superpower = Superpower.find_by(name: params[:superpower][:name])
    superpower_path(@superpower)
  end

end
