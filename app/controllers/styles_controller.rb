class StylesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @styles = Style.order(:name)
  end

  def new    
  end

  def create    
  end

  def edit    
  end

  def update    
  end

  def destroy    
  end
end
