class SuperpowersController < ApplicationController
  before_action :select_superpower, only: [:show]
  def index
    @superpowers = Superpower.all
  end

  def show
  end

  private

  def select_superpower
    @superpower = Superpower.find(params[:id])
  end
end
