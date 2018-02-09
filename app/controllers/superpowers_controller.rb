class SuperpowersController < ApplicationController

  def index
    @superpowers = Superpower.all
  end

  def show
    @superpower = Superpower.find_by(id: params[:id])

  end

  def new
    @superpower = Superpower.new
  end

  def create
  end

end
