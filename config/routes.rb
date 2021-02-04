Rails.application.routes.draw do
  namespace :public do
    get 'articles/index'
    get 'articles/show'
    get 'articles/new'
    get 'articles/edit'
  end
  root "homes#home"
  scope module: :public do
    resource :session, only: [:new, :create, :destroy]
    get "/homepages/list", to: "homepages#list", as: :list_homepages
    resources :users do
      resources :homepages, shallow: true do
        resources :articles, shallow: true
      end
    end
  end
  get 'homes/about', as: :about
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
