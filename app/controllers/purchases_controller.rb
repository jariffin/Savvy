class PurchasesController < ApplicationController

  def create

  end

  def index
    # @purchases = current_user.purchases - change when sign in works.
    @purchases = Purchase.all
    percentages = @purchases.map {|purchase| purchase.garment.percentage }
    @average = percentages.sum(0.0) / percentages.size
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    redirect_to purchases_path
  end

  private

end
