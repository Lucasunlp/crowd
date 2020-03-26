Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do
        resources :movies
        resources :persons do
          collection do
            get 'directors'
            get '/directors/:id', to: 'persons#show'
            get 'producers'
            get '/producers/:id', to: 'persons#show'
            get 'users'
          end
        end
      end
    end
end
