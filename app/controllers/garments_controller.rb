class GarmentsController < ApplicationController

  def new
    @garment = Garment.new
    @garment.blends.build
    @garment.materials.build
  end

  def create
    raise
    @brand = Brand.new
    @garment = Garment.new(garments_params)
    if @garment.save
      flash.alert = "Garment saved"
    else
      flash.alert = "Garment not saved"
    end
  end

  def calculate_rating

  end

  def show
    @garment = Garment.find(params[:id])
  end

  def index

  end

  private

  def garments_params
    params.require(:garment).permit(:name, :brand_id, blends_attributes: [:material_id, :percentage_material, :id, :_destroy])
  end

end
