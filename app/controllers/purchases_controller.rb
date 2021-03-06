class PurchasesController < ApplicationController
    before_action :authenticate_user!

  def new
    @purchase = Purchase.new(garment_id: params[:garment_id])
    garment = current_user.purchases.where(garment_id: params[:garment_id])
    @purchase.user = current_user
    if @purchase.save
      redirect_to purchases_path, notice:  "Garment successfully added to closet!"
    end
  end

  def index
    # @purchases = current_user.purchases - change when sign in works.
    @purchases = Purchase.all
    percentages = @purchases.map {|purchase| purchase.garment.percentage }
    @average = percentages.sum(0.0) / percentages.size
    if (@average < 75 && @average > 50)
      @color = 'yellow'
    elsif @average < 50
      @color = 'red'
    else
      @color = 'green'
    end
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
