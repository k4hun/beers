class PublicController < ApplicationController
  def index
    @beers = Beer.order(:name).paginate(page: params[:page]).search(params)
    @styles = Style.all
  end
end
