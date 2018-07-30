class CreateSkus < ActiveRecord::Migration[5.1]
  def change
    create_table :skus do |t|
      t.string :sku_combination
      t.integer :sku_denomination

      t.timestamps
    end
  end
end
