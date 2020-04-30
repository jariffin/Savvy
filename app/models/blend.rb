class Blend < ApplicationRecord
  belongs_to :material
  belongs_to :garment

  validates :percentage_material, presence: true

  validates_numericality_of :percentage_material,
    less_than_or_equal_to: 100,
    greater_than: 0,
    message: "range: 1-100%"


end
