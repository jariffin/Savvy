class ChangeBrandIdNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :garments, :brand_id, true
  end
end
