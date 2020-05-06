class Purchase < ApplicationRecord
  belongs_to :garment
  belongs_to :user

  has_one_attached :image

  def purchase_image
    if self.garment.image.attached?
      self.garment.image.key
    else
      "https://images.unsplash.com/photo-1558361716-f8144bad90f3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80"
    end
  end
end

