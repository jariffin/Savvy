class Garment < ApplicationRecord
  belongs_to :brand

  has_many :blends
  has_many :materials, through: :blends


  has_one_attached :photo

  accepts_nested_attributes_for :blends, reject_if: :all_blank, allow_destroy: true
  # accepts_ nested_attributes_for :materials, reject_if: :all_blank, allow_destroy: true

  def percentage
    percentages = []
    material = []

    self.materials.each do |m|
        material << m.material_rating
    end

    self.blends.each do |b|
      percentages << b.percentage_material
    end

    rating = percentages.zip(material).map{|x,y| x * y}

    return (rating.sum)/10
  end
  def percent_color
      if (self.percentage < 90 && self.percentage > 50)
        'yellow'
      elsif self.percentage < 50
        'red'
      else
        'green'
      end
  end
end
