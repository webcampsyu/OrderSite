Rails.application.routes.draw do
  #管理者用
  devise_for :admins, skip: [:registarations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    root to: "homes#top" 
    resources :products, only: [:index, :show, :new, :create, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:show]
    resources :customers, only: [:index]
  end
  
  #顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do 
    root to: "homes#top"
    get 'customers/mypage' => 'customers#show', as: 'mypage'
    get '/genre/:id' => 'homes#index', as: 'index'
    resources :products, only: [:index, :show]
    resources :site_names, only: [:index, :show, :create, :edit, :update]
    resources :orders, only: [:new, :index, :show, :create] do
      collection do
        post 'confirm'
        get 'thanks'
      end
    end
    resources :product_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
