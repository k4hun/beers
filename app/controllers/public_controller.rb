class PublicController < ApplicationController
  def index
    @beers = Beer.order(:name).paginate(page: params[:page]).search(params)
    @styles = Style.all
  end

  def show
    @beer = Beer.find(params[:id])
  end
end
