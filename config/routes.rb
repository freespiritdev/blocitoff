Blocitoff::Application.routes.draw do
  
  devise_for :users
  resources :users
  resources :tasks


  
  get 'welcome/index'

  get 'welcome/about'

  
    root to: 'tasks#index'
end
