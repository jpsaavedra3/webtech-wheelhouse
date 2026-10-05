Rails.application.routes.draw do
 get "up" => "rails/health#show", as: :rails_health_check

 root "pages#home"

 get "visiting", to: "pages#visiting", as: :visiting
 get "about",    to: "pages#about",    as: :about

 resources :customers
 resources :bikes
resources :repairs do
    delete "photos/:photo_id", to: "repairs#remove_photo", as: :photo, on: :member
end
 resources :services
 resources :users
end
