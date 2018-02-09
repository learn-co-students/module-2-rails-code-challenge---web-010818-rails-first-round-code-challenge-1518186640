

class SuperheroesController < ApplicationController

  def index
    @superheroes = Superhero.all

    if params[:search]
    
      @superpower = Superpower.find_by(name: params[:search])
      @superheroes = Superhero.all.select do |s|
        s.superpower_id == @superpower.id
      end
    end

    @superheroes
  end


  def show
    @superhero = Superhero.find_by(id: params[:id])
    @superpower = Superpower.find_by(id: @superhero.superpower_id)
  end

  def new
    @superhero = Superhero.new

  end

  def create
    @superhero = Superhero.new(superhero_params(:name, :super_name, :superpower_id))

    if @superhero.valid?
       @superhero.save
       redirect_to superhero_path(@superhero)
    else
      render :new
    end

  end

  private

  def superhero_params(*args)
    params.require(:superhero).permit(*args)
  end

end
