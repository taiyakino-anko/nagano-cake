Rails.application.routes.draw do

  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/destroy_all'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  
  get 'homes/top'
  get 'homes/about'
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  get "search" => "searches#search"
  devise_for :customers,skip:[:password],controllers:{
    registriations:"public/registrations",
    sessions:'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
