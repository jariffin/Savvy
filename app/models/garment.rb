class Garment < ApplicationRecord
  belongs_to :brand

  has_many :blends
  has_many :materials, through: :blends

  has_one_attached :photo
end
