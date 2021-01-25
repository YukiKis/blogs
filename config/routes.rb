Rails.application.routes.draw do
  scope module: :public do
    resources :users
    resource :session, only: [:new, :create, :destroy]
  end
  root "homes#home"
  get 'homes/about', as: :about
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
