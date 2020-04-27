class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.boolean :synthetic

      t.timestamps
    end
  end
end
