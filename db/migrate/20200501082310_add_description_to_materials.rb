class AddDescriptionToMaterials < ActiveRecord::Migration[6.0]
  def change
    add_column :materials, :description, :text
  end
end
