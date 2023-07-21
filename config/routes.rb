Rails.application.routes.draw do
  #管理者用
  devise_for :admins, skip: [:registarations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    root to: "homes#top" 
    resources :products, only: [:index, :show, :new, :create, :edit, :update]
    resources :genres, only: [:index, :show, :create, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :customers, only: [:index, :show]
  end
  #顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
