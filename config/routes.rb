Rails.application.routes.draw do
  root 'courses#index'

  get 'about', to: 'pages#about'

  resources :courses

  resources :students

  get "signup", to: "students#new"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  post "enroll", to: "student_courses#create"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
