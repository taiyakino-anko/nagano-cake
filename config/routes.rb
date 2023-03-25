Rails.application.routes.draw do

  devise_for :customers,skip:[:password],controllers: {
    registrations:"public/registrations",
    sessions:'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :new, :show, :edit, :create, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    get 'homes/top'
  end

  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  get "search" => "searches#search"

 scope module: :public do
     get '/customers/my_page' => 'customers#show', as: 'customer'
     get 'customers/information/edit' => 'customers#edit', as: 'edit_customer'
     patch 'customers/information' => 'customers#update', as: 'customer_update'
     get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
     patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw'

   resources :orders, only: [:new, :confirm, :finish, :index, :show, :create]
   resources :addresses, only: [:index, :edit,:create,:update,:destroy]
   resources :cart_items, only: [:index,:update,:destroy,:create] do
    collection do
     delete :destroy_all
    end
   end
   resources :items, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
 end