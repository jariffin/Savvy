class BrandsController < ApplicationController

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brands_params)
    @garment = Garment.find(params:[:garment_id])
    @brand.garment_id = @garment.id
    @brand.save
  end

  private

  def brands_params
    params.require(:brand).permit(:name, :website, :email)
  end

end
