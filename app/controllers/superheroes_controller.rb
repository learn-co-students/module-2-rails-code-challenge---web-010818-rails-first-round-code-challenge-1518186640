class SuperheroesController < ApplicationController


  def new
    @superhero = Superhero.new
  end

  def show
    @superhero = Superhero.find(params[:id])
  end


  def create
   @superhero = Superhero.create(superhero_params)
   redirect_to @superhero
 end

  def show
    @superhero = Superhero.find_by(id: params[:id])
  end

    def edit
      @superhero = Superhero.find(params[:id])
    end

    def index
      @superheroes = Superhero.all
    end



    def destroy
      @superhero = Superhero.find(params[:id])
      @superhero.destroy
      redirect_to @superhero

    end

    def update
      @superhero = Superhero.find(params[:id])
      if @superhero.update(@superhero_params)
        redirect_to @superhero
      else
      render :edit
    end
  end


    private
    def superhero_params
      params.require(:superhero).permit(:name, :super_name, :superpower_id)
    end

  end
