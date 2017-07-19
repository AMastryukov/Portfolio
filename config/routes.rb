Rails.application.routes.draw do
  resources :projects
  resources :posts

  root 'projects#index'
end
