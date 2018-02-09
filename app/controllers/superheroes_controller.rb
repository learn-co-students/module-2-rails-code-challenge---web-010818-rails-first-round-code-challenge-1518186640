class SuperheroesController < ApplicationController
  before_action :select_superhero, only: [:show]

  def index
    @superheroes = Superhero.all
    if params[:q]
      @superheroes = Superhero.all.select do |superhero|
        superhero.superpower.name == params[:q].downcase
      end
    end
  end

  def show
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

  def select_superhero
    @superhero = Superhero.find(params[:id])
  end

end
