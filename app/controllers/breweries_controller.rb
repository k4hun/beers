class BreweriesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @breweries = Brewery.order(:name)
  end

  def new
    @brewery = Brewery.new
  end

  def create
    @brewery = Brewery.new(brewery_params)
    if @brewery.save
      redirect_to breweries_path, notice: 'Brewery added!'
    else
      render 'new', error: 'Something went wrong!'
    end
  end

  def edit
    current_brewery
  end

  def update
    @brewery = current_brewery
    if @brewery.update_attributes(brewery_params)
      redirect_to breweries_path, notice: 'Brewery updated!'
    else
      render 'edit', error: 'Something went wrong!'
    end
  end

  def destroy
    current_brewery.destroy
    redirect_to breweries_path, notice: 'Brewery removed!'
  end

  private

  def brewery_params
    params.require(:brewery).permit(:name, :logo)
  end

  def current_brewery
    @brewery ||= Brewery.find(params[:id])
  end
end
