Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

#  Rails.application.routes.draw do
#  devise_for :users
#    root "projects#index"
#    resources :projects
#  end

end
