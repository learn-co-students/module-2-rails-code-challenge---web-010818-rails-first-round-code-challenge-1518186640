class SuperheroesController < ApplicationController

  def index
    if params[:search]
      @superheroes = Superhero.search_by_superpower(params[:search])
    else
      @superheroes = Superhero.all
    end
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.new(superhero_params)

    if @superhero.save
      redirect_to @superhero
    else
      render :new
    end
  end

  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end
end
