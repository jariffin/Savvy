class AddTagTextToGarments < ActiveRecord::Migration[6.0]
  def change
      add_column :garments, :tag_text, :string
  end
end
