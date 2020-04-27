class CreateGarments < ActiveRecord::Migration[6.0]
  def change
    create_table :garments do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
    end
  end
end
