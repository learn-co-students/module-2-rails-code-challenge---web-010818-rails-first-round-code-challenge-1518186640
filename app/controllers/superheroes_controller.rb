class SuperheroesController < ApplicationController

  def index
    if params[:q]
      # binding.pry
      a = Superpower.find_by(name: params[:q])
      super_id = a[:id]
      @superheroes = Superhero.where(superpower_id: super_id)
    # binding.pry
    else
      @superheroes = Superhero.all
    end
    # binding.pry
  end

  def show
    @superhero = Superhero.find_by(id: params[:id])
  end

  def new
    @superhero = Superhero.new
  end

  def create
    # binding.pry
    @superhero = Superhero.new(superhero_params)
    if @superhero.save
      redirect_to @superhero
    else
      render :new
    end
  end

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end

end
