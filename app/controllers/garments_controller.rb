class GarmentsController < ApplicationController

  def new
    @garment = Garment.new
    @garment.blends.build
    @garment.materials.build
  end

  def create
    @brand = Brand.new
    @garment = Garment.new(garments_params)
    if @garment.save
      redirect_to garment_path(@garment)
    else
      render :new
    end
  end

  def show
    @garment = Garment.find(params[:id])
    @garment_rating = @garment.percentage
  end

  def index

  end

  private

  def garments_params
    params.require(:garment).permit(:name, :brand_id, blends_attributes: [:material_id, :percentage_material, :id, :_destroy])
  end

end
