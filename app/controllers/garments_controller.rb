class GarmentsController < ApplicationController

  def new
    @garment = Garment.new
    @garment.blends.build
    @garment.materials.build
  end

  def create
    @brand = Brand.new
    @garment = Garment.new(garments_params)
    tag_text = RTesseract.new(params[:garment][:tag].tempfile.path).to_s
    @garment.tag_text = tag_text
    @garment.tag_text_to_blends
    if @garment.save
      redirect_to garment_path(@garment)
    else
      render :new
    end
  end

  # def scan
  #   @garment = Garment.new

  #   @scan.to_s
  # end

  def show
    @garment = Garment.find(params[:id])
    @garment_rating = @garment.percentage
  end

  def index

  end

  private

  def garments_params
    params.require(:garment).permit(:name, :brand_id, :image, :tag, blends_attributes: [:material_id, :percentage_material, :id, :_destroy])
  end

end
