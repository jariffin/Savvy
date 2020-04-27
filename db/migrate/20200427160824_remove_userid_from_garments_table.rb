class RemoveUseridFromGarmentsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :garments, :user_id
  end
end
