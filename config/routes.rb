Rails.application.routes.draw do


get 'sessions/new'
delete 'orders/:order_id/remove/:id', to: 'orders#remove', as: 'remove_item'
root 'products#index'

get 'login' => 'sessions#new'
post 'sessions' => 'sessions#create'
delete 'logout' => 'sessions#destroy'

patch 'users/:user_id/orders/:order_id/select/:id' => 'orders#select_card', as: 'select_card'
delete 'users/:user_id/orders/:order_id/delete/:id' => 'orders#remove_card', as: 'remove_card'
post 'users/:user_id/orders/ship/:id' => 'orders#shipped', as: 'shipped_order'


  resources :users, except: [:index, :new] do
      resources :orders, :cards, except: [:index]
  end

  resources :products, only: [:index, :show]

  
end
