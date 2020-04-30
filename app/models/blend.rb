class Blend < ApplicationRecord
  belongs_to :material
  belongs_to :garment

  # validates :material_id,
  validates_numericality_of :percentage_material, {
    greater_than: 0,
    less_than_or_equal_to: 100,
      message: "Please enter a number between 0 and 100" }


  # def validate_max_percentage_has_not_been_reached

  # end
end
