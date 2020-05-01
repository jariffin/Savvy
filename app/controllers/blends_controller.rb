class BlendsController < ApplicationController

  def new
    @garment = Garment.find(params[:garment_id])
    @blend = Blend.new
  end

  def create
    @blend = Blend.new(blends_params)
    @garment = Garment.find(params[:garment_id])
    @blend.garment_id = @garment.id
    if @blend.save
      flash.now = "Blend saved"
    else
      flash.now = "Blend not saved"
    end
  end

  private

  def blends_params
    params.require(:blend).permit(:material_id, :garment_id, :percentage_material)
  end

end
