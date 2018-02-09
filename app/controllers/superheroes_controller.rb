class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
    @superpowers = Superpower.all
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.new(superhero_params)
    if @superhero.valid?
      @superhero.save
      redirect_to superhero_path(@superhero)
    else
      render :new
    end
  end





private

def superhero_params
  params.require(:superhero).permit(:name, :super_name, :superpower_id)
end


end
