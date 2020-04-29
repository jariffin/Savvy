class Garment < ApplicationRecord
  belongs_to :brand

  has_many :blends
  has_many :materials, through: :blends


  has_one_attached :photo

  accepts_nested_attributes_for :blends, reject_if: :all_blank, allow_destroy: true
  # accepts_ nested_attributes_for :materials, reject_if: :all_blank, allow_destroy: true

end
