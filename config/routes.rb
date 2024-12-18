Rails.application.routes.draw do
  get "/products", to: "products#index"
end
Rails.application.routes.draw do
  resources :products
end