class RemovePhotoFromGarments < ActiveRecord::Migration[6.0]
  def change
    remove_column :garments, :photo, :string
  end
end
