class SuperheroesController < ApplicationController
  def index
    if params[:commit]
      @superheroes = Superhero.all.select {|sh| sh.superpower.name.downcase == params[:q].downcase}
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
    if Superhero.find_by(super_name: params[:superhero][:super_name])
      flash[:message] = "Super Name already exists"
      redirect_to new_superhero_path
    else
      @superhero = Superhero.create(superhero_params)
      redirect_to @superhero
    end
  end

  def search
    byebug
  end


  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end
end
