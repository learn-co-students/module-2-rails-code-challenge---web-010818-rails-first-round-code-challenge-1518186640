class SuperpowersController < ApplicationController



def new
  @superpower = Superpower.new
end

def create
  @superpower = Superpower.new(@superpower_params)

  if @superpower.valid?
    @superpower.save
    redirect_to @superpower
  else
    render :new
end
end

def show
  @superpower = Superpower.find(params[:id])
end

  def edit
    @superpower = Superpower.find(params[:id])
  end

  def index
    @superpowers = Superpower.all
  end



  def destroy
    @superpower = Superpower.find(params[:id])
    @superpower.destroy
    redirect_to @superpower

  end

  def update
    @superpower = Superpower.find(params[:id])
    if @superpower.update(@superpower_params)
      redirect_to @superpower
    else
    render :edit
  end
end


    private
    def superpower_params
      params.require(:superpower).permit(:name, :description)
    end


  end
