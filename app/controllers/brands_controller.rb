class BrandsController < ApplicationController

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brands_params)
    @garment = Garment.find(params:[:garment_id])
    # can use garment instance here, before garment is saved?
    @brand.garment_id = @garment.id
    @brand.save
  end


  private

  # possible with just name?

  def brands_params
    params.require(:brand).permit(:name, :website, :email)
  end

end
