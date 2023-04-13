Rails.application.routes.draw do
  devise_for :users
  resources :courses do 
    resources :sections
  end
  resources :users, only: [:index, :edit, :show, :update]
  root 'sites#index'
  get 'sites/index'
  get 'sites/activity'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :courses do
    # collection do
    #   match 'search' => 'courses#search', via: [:get, :post], as: :search
    # end
  # end
end
