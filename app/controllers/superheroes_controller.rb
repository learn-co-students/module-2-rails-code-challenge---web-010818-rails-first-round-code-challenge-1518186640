class SuperheroesController < ApplicationController
  def index
    if params[:term]
      @superpower = Superpower.where('name LIKE ?', "%#{params[:term]}%")
      @superheroes = Superhero.select { |s| s.superpower == @superpower[0] }
    else
      @superheroes = Superhero.all
    end
  end

  def show
    @superhero = Superhero.find_by(id: params[:id])
  end

  def new
    @superhero = Superhero.new
  end

  def create
    ## Check if superhero "super name" already exists
    @superhero = Superhero.find_by(super_name: superhero_params[:super_name])
    if @superhero
      flash[:notice] = "This superhero super name already exists!"
      @superhero = Superhero.new(superhero_params)
      render new_superhero_path(@superhero)
    else ## Super Name doesn't already exist
      @superhero = Superhero.create(superhero_params)
      redirect_to superheroes_path
    end
  end

  private
  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id, :term)
  end
end
