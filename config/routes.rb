Rails.application.routes.draw do
  root "homes#home"
  scope module: :public do
    resource :session, only: [:new, :create, :destroy]
    resources :users do
      resources :homepages
    end
  end
  get 'homes/about', as: :about
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
