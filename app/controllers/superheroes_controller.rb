class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.new(sh_params)
    if @superhero.save
      redirect_to @supehero
    else
      render :new
    end
  end

  private
  def sh_params
    params.require(:superhero).permit(:name, :super_name, superpower_ids:[])
  end
end
