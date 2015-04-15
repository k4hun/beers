class PublicController < ApplicationController
  def index
    @beers = Beer.order(:name).paginate(page: params[:page]).search(params)
    @styles = Style.all
  end

  def show
    @beer = Beer.find(params[:id])
    @comments = Comment.where(beer_id: params[:id]).order(:created_at)
    @comment = Comment.new
  end
end
