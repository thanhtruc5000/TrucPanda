Rails.application.routes.draw do
  resources :accounts
  resource :session
  resources :passwords, param: :token

  resources :products do
    resources :subscribers, only: [:create]
  end

  # Cập nhật route cho unsubscribe để nhận token
  resource :unsubscribe, only: [:show], param: :token

  root "products#index"
end
