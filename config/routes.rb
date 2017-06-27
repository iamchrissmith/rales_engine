Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :customers do
        get '/find_all', to: "find#index"
        get '/find', to: "find#show"
      end

      namespace :merchants do
        get '/find_all', to: "find#index"
        get '/find', to: "find#show"
      end

      resources :transactions, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]

    end
  end
end
