class SuperheroesController < ApplicationController
  def index
    if params[:superpower]
      @superpower = Superpower.find_by(name: params[:superpower])
      @superheroes = Superhero.where("superpower_id = ?", @superpower.try(:id))
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
    @superhero = Superhero.create(superhero_params)
    if @superhero.save
      redirect_to @superhero
    else
      flash[:message] = "Please do not leave any field blank. Super names cannot be duplicated."
      render :new
    end
  end

  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id, :superpower)
  end
end
