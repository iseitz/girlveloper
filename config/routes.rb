Rails.application.routes.draw do
  resources :enrollments do
    get :my_course_students, on: :collection
  end
  devise_for :users
  resources :courses do 
    get :purchased, :missing_review, :created_courses, on: :collection
    resources :enrollments, only: [:new, :create]
    resources :sections do
      resources :lessons
    end
  end
  resources :users, only: [:index, :edit, :show, :update]
  root 'sites#index'
  get 'sites/index'
  get 'activity', to: 'sites#activity'
  get 'statistics', to: 'sites#statistics'

  namespace :charts do
    get 'users_per_day'
    get 'enrollments_per_day'
    get 'course_enrollments_total'
    get 'biggest_revenue'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :courses do
    # collection do
    #   match 'search' => 'courses#search', via: [:get, :post], as: :search
    # end
  # end
end
