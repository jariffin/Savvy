class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :website
      t.string :email

      t.timestamps
    end
  end
end
