class SuperheroesController < ApplicationController

  def index
    @superheroes = Superhero.all
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

  def edit
    @superhero = Superhero.find(params[:id])
  end

  def update
    @superhero = Superhero.find(params[:id])
    @superhero.update(superhero_params)
    if @superhero.valid?
       redirect_to @superhero
  else
    render :edit
  end
end

  def show
    @superhero = Superhero.find(params[:id])
  end

 #  def search
 # @superheroes = Superhero.include?()
 #  end


  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end


end
