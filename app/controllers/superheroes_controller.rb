class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
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

      redirect_to @superhero
    else
      render :new
    end
  end

  def search
    @search_term = params[:q]

    super_power_match = Superpower.all.find {|superpower| superpower.name == @search_term}

    @superheroes = Superhero.all.select do |superhero|
      superhero.superpower_id == super_power_match.id
    end

    render :index
  end

  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end

end
