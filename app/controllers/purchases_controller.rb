class PurchasesController < ApplicationController

  def create

  end

  def index
    # @purchases = current_user.purchases - change when sign in works.
    @purchases = Purchase.all
  end

  def destroy
    @purchase.destroy
    redirect_to purchases_path
  end

  private

end
