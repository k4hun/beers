class PublicController < ApplicationController
  def index
    @beers = Beer.order(:name).paginate(page: params[:page])
  end
end
