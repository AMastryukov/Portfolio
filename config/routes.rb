Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope '/portfolio' do
    resources :projects
  end

  scope '/blog' do
    resources :posts
  end

  root 'home#about'
end
