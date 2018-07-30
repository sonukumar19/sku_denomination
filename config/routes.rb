Rails.application.routes.draw do
  #devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#dashboard'
  get 'dashboard/:id', to: 'users#dashboard', as: 'dashboard'

  # users
  resources :users do
    collection do
      get 'sku_combination_creation', action: 'sku_combination_creation', as: 'sku_combination_creation' 
      post 'create_csv_combination', action: 'create_csv_combination', as: 'create_csv_combination'
    end
  end
end
