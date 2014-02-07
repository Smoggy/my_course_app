MyCourseApp::Application.routes.draw do


  resources :sessions, only: [:new, :create, :destroy ]
  get "users/new"
  root to: 'static_pages#home'


  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

end
