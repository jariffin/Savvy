class GarmentsController < ApplicationController

  def new
    @garment = Garment.new
    @garment.blends.build
    @garment.materials.build
  end

  def create
    @brand = Brand.new
    @garment = Garment.new(garments_params)
    if @garment.blends.length.zero? && !params[:garment][:tag].nil?
      tag_text = RTesseract.new(params[:garment][:tag].tempfile.path).to_s
      @garment.tag_text = tag_text
      @garment.tag_text_to_blends
      render :new
    else
      if @garment.save
        redirect_to garment_path(@garment)
      else params[:garment].nil?
        flash.alert = "Please fill in the form."
        render :new
      end
    end
  end

  def show
    @garment = Garment.find(params[:id])
    @garment_rating = @garment.percentage
  end

  def index

  end

  def update
    @garment = Garment.find(params[:id])
    @garment.name = @garment.find(params[:name])
    @garment.brand = @garment.find(params[:brand])
    @garment.image = @garment.find(params[:image])
    if @garment.update(garments_params)
      @purchase = Purchase.new(garment_id: @garment.id)
      @purchase.user = current_user
      @purchase.save
      redirect_to purchases_path, notice:  "Garment successfully added to closet!"
    else
      flash.alert = "Cannot update"
    end
  end

  private

  def garments_params
    params.require(:garment).permit(:tag, blends_attributes: [:material_id, :percentage_material, :id, :_destroy])
  end

end
