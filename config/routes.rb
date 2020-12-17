Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'users/show', to: "home#show"
  get 'users/all', to: "home#all"
  get 'users/edit', to: "home#edit"
  get 'users/other_edit', to: "home#other_edit"
  put 'users/other_edit', to: "home#other_update"
  # patch 'users/other_edit', to: "home#other_update"
  delete 'users/other_edit', to: "home#other_destroy"


end
