class SuperpowersController < ApplicationController

  def index
    @superpowers = Superpower.all
  end

  def show
    @superpower = Superpower.find(params[:id])
  end


private

  def superpower_params
    params.require(:superpower).permit(:name, :description)
  end


end
