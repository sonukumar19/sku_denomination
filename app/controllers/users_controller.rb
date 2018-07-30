class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user
  
  def dashboard
  	@combinations = Sku.where(user_id: current_user.id)
 	end

 	# method for sku creation
  def sku_combination_creation
  end

  # method for create combination with csv
  def create_csv_combination
  	Sku.import_uploaded_csv(params, current_user)
    flash[:success] = "Sku combination created successfully"
  	redirect_to action: 'dashboard'
  end

  private

  def load_user
    @user = current_user
  end
end
