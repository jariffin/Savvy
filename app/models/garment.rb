class Garment < ApplicationRecord
  belongs_to :brand, optional: true

  has_many :blends
  has_many :materials, through: :blends
  has_one_attached :image
  has_one_attached :tag

#  validates :materials, presence: true
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

  def create_blend(material, garment, percentage_material)
    garment.blends << Blend.new(material: material, percentage_material: percentage_material)
  end



  def tag_text_to_blends
    materials = []
    percentages = []

    composition = self.tag_text.split("%")
    composition.each_with_index do |c, i|
      Material.all.each do |m|
        if c.downcase.include?(m.name.downcase)
          materials << m
        end
      end

      numcap = c.match(/\d+/)
      if !numcap.nil?
        percentages << numcap[0]
      end

    end
    percentages.zip(materials).each do |pct, m| create_blend(m, self, pct)
    end
  end


  def percent_color
      if (self.percentage < 85 && self.percentage > 50)
        'yellow'
      elsif self.percentage < 50
        'red'
      else
        'green'
      end
  end

  def slogan
    positive_slogan = ['Great choice!', 'GO ECO!', 'Perfect!', 'Go GREEN!', 'Welcome to the ECO club!', 'Small ecological footprint, and a giant leap for mankind!']
    neuteral_slogan = ['I can see you are trying!', 'No one succeeds without effort.', 'You can do anything if you set your mind to it. Keep trying!', 'It does not matter how slowly you go as long as you do not stop.', 'Continue this way to break the ECO barrier in your life']
    negative_slogan = ['Seriously?!', 'Failure is only the opportunity to begin again', 'Maybe you will look for something better?', 'Don\'t tell me you want to buy that..', 'Not approved by ECO team', 'Welcome to the dark side!']
    if percent_color == 'green'
      positive_slogan.sample
    elsif percent_color == 'yellow'
      neuteral_slogan.sample
    else
      negative_slogan.sample
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
