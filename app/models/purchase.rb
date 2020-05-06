class Purchase < ApplicationRecord
  belongs_to :garment
  belongs_to :user

  has_one_attached :image

  def default_image
    if purchase.garment.image.attached? == false
      "https://images.unsplash.com/photo-1527519124254-9dafd8b3533b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1534&q=80"
    else
      purchase.garment.image.key
    end
  end
end

