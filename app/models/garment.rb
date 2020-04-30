class Garment < ApplicationRecord
  belongs_to :brand

  has_many :blends
  has_many :materials, through: :blends
  has_one_attached :image

  validates :name, presence: true
  validate :max_percentage_has_not_been_reached

  accepts_nested_attributes_for :blends, reject_if: :all_blank, allow_destroy: true

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

  private

    def max_percentage_has_not_been_reached

      percentage = self.blends.map { |b| b.percentage_material }.compact.sum
      if percentage > 100 || percentage < 100
        errors[:base] << "Total material percentage must be between 0 and 100%"
      end
    end


end
