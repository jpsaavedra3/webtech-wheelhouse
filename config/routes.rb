Rails.application.routes.draw do
 # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
 # Can be used by load balancers and uptime monitors to verify that the app is live.
 get "up" => "rails/health#show", as: :rails_health_check

 root "pages#home"

 get "visiting", to: "pages#visiting", as: :visiting
 get "about",    to: "pages#about",    as: :about

 resources :customers, only: [ :index, :show ]
 resources :bikes,     only: [ :index, :show ]
 resources :repairs,   only: [ :index, :show ]
 resources :services,  only: [ :index, :show ]
 resources :users,     only: [ :index, :show ]
end
