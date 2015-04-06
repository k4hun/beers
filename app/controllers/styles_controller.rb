class StylesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @styles = Style.order(:name)
  end

  def new 
    @style = Style.new   
  end

  def create  
    @style = Style.new(style_params)  
    if @style.save
      redirect_to styles_path, notice: 'Style added!'
    else
      render 'new', error: 'Something went wrong!'
    end
  end

  def edit
    current_style    
  end

  def update  
    @style = current_style
    if @style.update_attributes(style_params) 
      redirect_to styles_path, notice: 'Style updated!' 
    else
      render 'edit', error: 'Something went wrong!'
    end
  end

  def destroy 
    current_style.destroy 
    redirect_to styles_path, notice: 'Style removed!'  
  end

  private
  def style_params
    params.require(:style).permit(:name, :description) 
  end

  def current_style
    @style ||= Style.find(params[:id])
  end

end
