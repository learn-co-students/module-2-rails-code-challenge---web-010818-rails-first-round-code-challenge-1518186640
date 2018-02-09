class SuperpowersController < ApplicationController

  def index
    @superpowers = Superpower.all
  end

  # def new
  #   @superpower = Superpower.new
  # end
  #
  # def create
  #   @superpower = Superpower.new(superpower_params)
  #   if @superpower.valid?
  #     @superpower.save
  #     redirect_to @superpower
  #   else
  #     render :new
  #   end
  # end
#
#   def edit
#     @superpower = Superpower.find(params[:id])
#   end
#
#   def update
#     @superpower = Superpower.find(params[:id])
#     @superpower.update(superpower_params)
#     if @superpower.valid?
#        redirect_to @superpower
#   else
#     render :edit
#   end
# end

  def show
    @superpower = Superpower.find(params[:id])
  end


  private

  def superpower_params
    params.require(:superpower).permit(:name, :description)
  end

end
