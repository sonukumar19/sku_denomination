class Sku < ApplicationRecord
  require 'csv'
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  validates :sku_denomination, :sku_combination, presence: true
  class << self
    # method for read csv uploaded file
    def import_uploaded_csv(params, user)
    	user.skus.delete_all if user.skus.present?
      csv = CSV.read(params[:file].path, :headers=>true)
      sku_number = params[:sku_denomination_number]
      csv['option1_sku'].compact.each do |opt1_val|
        arr = []
        arr << opt1_val
        csv['option2_sku'].compact.each do |opt2_val|
          arr << opt2_val
          csv['option3_sku'].compact.each do |opt3_val|
            arr << opt3_val
      			sku_number = sku_number.to_i + 1
            create_sku_combination(arr, sku_number, user)
          end
          arr = []
          arr << opt1_val
        end
      end
      SkuCombinationNotificationMailer.send_email(user).deliver
    end

    # method for create sku
    def create_sku_combination(arr, number, user)
      Sku.create(sku_denomination: number, sku_combination: arr*",", user_id: user.id)
    end
  end
end
