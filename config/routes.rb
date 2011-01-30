# encoding: UTF-8
PetsWaiting::Application.routes.draw do
  filter :locale

  devise_for :users

  resources :pets do
    resources :photos
    resources :adoptions do
      post 'external_adoption', :on => :collection
    end
  end

  resources :users do
    resources :adoptions
    resources :pets
  end

  resources :breeds

  match 'colaborate' => 'info#colaborate', :as => :colaborate
  match 'about' => 'info#about', :as => :about
  match 'contact' => 'info#contact', :as => :contact

  match 'change_language' => 'sessions#change_language', :as => :change_language

  root :to => "pets#index"
end
