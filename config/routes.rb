Rails.application.routes.draw do


get 'sessions/new'

root 'products#index'

get 'login' => 'sessions#new'
post 'sessions' => 'sessions#create'
delete 'logout' => 'sessions#destroy'



  resources :users, except: [:index] do
      resources :orders, :cards, except: [:index] 
  end

  resources :products, only: [:index, :show]

  
end
