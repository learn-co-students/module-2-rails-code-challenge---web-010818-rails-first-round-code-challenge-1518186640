class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
    if params[:search]
      @superpower = Superpower.find_by(name: params[:search])
      if @superpower
        @superheroes = Superhero.search(@superpower.id)
      end
    else
      "No result"
    end
  end

  def show
    @superhero = Superhero.find(params[:id])
    @superpower = @superhero.superpower
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
      flash[:message] = "This super name already exists. Please choose another one"
      render 'new'
    end
  end


  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end


end
