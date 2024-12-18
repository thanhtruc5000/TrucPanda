Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  get "/products", to: "products#index"
end
Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :products
end
Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :products
  root "products#index"
end