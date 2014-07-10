Rails.application.routes.draw do


get 'sessions/new'
delete 'orders/:order_id/remove/:id', to: 'orders#remove', as: 'remove_item'
root 'products#index'

get 'login' => 'sessions#new'
post 'sessions' => 'sessions#create'
delete 'logout' => 'sessions#destroy'



  resources :users, except: [:index, :new] do
      resources :orders, :cards, except: [:index] 
  end

  resources :products, only: [:index, :show]

  
end
