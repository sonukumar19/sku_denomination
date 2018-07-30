class AddAvatarToSkus < ActiveRecord::Migration[5.1]
  def change
    add_column :skus, :avatar, :string
  end
end
