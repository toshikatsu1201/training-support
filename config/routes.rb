Rails.application.routes.draw do
  devise_for :users
  root to:"memos#index"

  resources :memos, only: [:index, :new, :create] do
    resources :creatememos, only: [:create, :new]
  end
  resources :tips, only: [:index]
end
