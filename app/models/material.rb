class Material < ApplicationRecord
has_many :blends

# validates name:, material_rating:, presence: true
end
