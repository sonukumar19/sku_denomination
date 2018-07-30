FactoryGirl.define do
  factory :sku do
    sku_denomination "9"
    sku_combination "www3333, 333333"
    user_id 1
    after(:create) { |sku| sku.confirm }
  end
end