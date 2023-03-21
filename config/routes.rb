Rails.application.routes.draw do

devise_for :customers,skip:[:password],controllers:{
    registriations:"public/registrations",
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

   resources :customers, only: [:show, :edit, :update] do
     get :unsubscribe
     get :withdraw
   end

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