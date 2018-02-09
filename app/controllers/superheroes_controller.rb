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
        flash[:message] = "Invalid Entries"
        render :new
     end
  end

  # def edit
  # end
  #
  # def update
  # end

  def search
    @superheroes = Superhero.all.select do |instance|
      instance.superpower.name == (params[:q])
    end
      if @superheroes.length > 0
        render :search
      else
        flash[:not_found] = "No superpower with that name!!"
        redirect_to superheroes_path
      end
  end





private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end

end
