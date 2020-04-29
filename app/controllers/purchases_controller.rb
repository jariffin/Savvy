class PurchasesController < ApplicationController

  def create
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
  end

end
