class AddUserIdToSkus < ActiveRecord::Migration[5.1]
  def change
    add_column :skus, :user_id, :integer
  end
end
