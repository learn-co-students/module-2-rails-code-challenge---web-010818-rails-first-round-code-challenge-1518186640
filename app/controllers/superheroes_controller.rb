class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
  end

  def show
    @superhero = Superhero.find(params[:id])
    @superpower = @superhero.superpower
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.new(hero_params)

    if @superhero.valid?
      @superhero.save
      redirect_to superhero_path(@superhero.id)
    else
      render :new
    end


  end


  def hero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end


end
