class Purchase < ApplicationRecord
  belongs_to :garment
  belongs_to :user

end
