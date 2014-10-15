Blocitoff::Application.routes.draw do
  get 'tasks/index'

  get 'tasks/new'

  get 'tasks/edit'

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  
    root to: 'welcome#index'
end