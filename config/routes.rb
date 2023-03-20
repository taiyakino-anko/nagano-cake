Rails.application.routes.draw do
  
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
