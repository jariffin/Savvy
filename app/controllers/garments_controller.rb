class GarmentsController < ApplicationController

  def new
    @garment = Garment.new
  end

  def create
  end

  def show
    @garment = Garment.find(params[:id])
  end

  def index

  end

end
