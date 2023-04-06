Rails.application.routes.draw do
  devise_for :users
  resources :courses
  resources :users, only: [:index]
  root "sites#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :courses do
    # collection do
    #   match 'search' => 'courses#search', via: [:get, :post], as: :search
    # end
  # end
end
