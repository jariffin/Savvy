class GarmentsController < ApplicationController

  def new
    @garment = Garment.new
    @garment.blends.build
    @garment.materials.build
  end

  def create
    @brand = Brand.new
    @garment = Garment.new(garments_params)
    if @garment.blends.length.zero?
      tag_text = RTesseract.new(params[:garment][:tag].tempfile.path).to_s
      @garment.tag_text = tag_text
      @garment.tag_text_to_blends
      render :new
    elsif
      @garment.save
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

  def update
   @garment = Garment.new(garments_params)
    if current_user.nil?
      redirect_to new_user_session_path
    else @garment.user_id = current_user.id
      if @garment.update(garments_params)
        #redirect to new purchase
        redirect_to purchases_path, notice:  "Garment successfully added to closet!"
      else
        render :edit
      end
    end
  end

  private

  def garments_params
    params.require(:garment).permit(:name, :brand_id, :image, :tag, blends_attributes: [:material_id, :percentage_material, :id, :_destroy])
  end

end
