class SuperheroesController < ApplicationController

  def new
    @superhero = Superhero.new
    @superpowers = Superpower.all
  end

  def create
    @superhero = Superhero.new
    if @superhero.update(superhero_params)
      redirect_to superheroes_path
    else
      flash[:message] = "That super name already exists"
      redirect_to new_superhero_path
    end
  end

  def index
    if params[:commit] == "Search"
      @superpower = Superpower.find_by(name: params[:name])
      @superheroes = Superhero.where(["superpower_id = ?", @superpower.id])
    else
      @superheroes = Superhero.all
    end
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end
end
