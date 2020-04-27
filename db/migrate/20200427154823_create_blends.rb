class CreateBlends < ActiveRecord::Migration[6.0]
  def change
    create_table :blends do |t|
      t.references :material, null: false, foreign_key: true
      t.references :garment, null: false, foreign_key: true
      t.integer :percentage_material

      t.timestamps
    end
  end
end
