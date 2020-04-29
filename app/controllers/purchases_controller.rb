class PurchasesController < ApplicationController
    before_action :authenticate_user!

  def new
    @purchase = Purchase.new(garment_id: params[:garment_id])
    garment = current_user.purchases.where(garment_id: params[:garment_id])
    unless garment.length > 0
      @purchase.user = current_user
      @purchase.save
    end
    #confirm
    redirect_to purchases_path
  end


  def index
    # @purchases = current_user.purchases - change when sign in works.
    @purchases = Purchase.all
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    redirect_to purchases_path
  end

  private

  def purchases_params
     params.require(:purchase).permit(:garment_id, :user_id)
  end

end
