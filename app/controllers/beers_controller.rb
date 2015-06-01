class BeersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @beers = Beer.order(:name)
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      redirect_to beers_path, notice: 'Beer added!'
    else
      render 'new', error: 'Something went wrong!'
    end
  end

  def edit
    current_beer
  end

  def update
    @beer = current_beer
    if @beer.update_attributes(beer_params)
      redirect_to beers_path, notice: 'Beer updated!'
    else
      render 'edit', error: 'Something went wrong!'
    end
  end

  def destroy
    current_beer.destroy
    redirect_to beers_path, notice: 'Beer removed!'
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :description, :style_id,
                                 :brewery_id, :rating, :photo)
  end

  def current_beer
    @beer ||= Beer.find(params[:id])
  end
end
