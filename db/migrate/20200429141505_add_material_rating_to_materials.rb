class AddMaterialRatingToMaterials < ActiveRecord::Migration[6.0]
  def change
    add_column :materials, :material_rating, :integer
  end
end
