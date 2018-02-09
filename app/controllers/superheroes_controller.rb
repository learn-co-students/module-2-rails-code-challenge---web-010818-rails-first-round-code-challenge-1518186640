class SuperheroesController < ApplicationController
  def index
    if params[:superpower]
      superpower = Superpower.find_by(name: params[:superpower])
      @superheroes = Superhero.where("superpower_id = id")
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
    @superhero = Superhero.new(sh_params)
    if @superhero.save
      redirect_to superhero_path(@superhero)
    else
      render :new
    end
  end

  private
  def sh_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end
end
