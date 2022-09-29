Rails.application.routes.draw do

  root 'public/homes#top'
  get 'about' => 'public/homes#about'

  get 'items' => 'public/items#index'
  get 'items/:id', to: 'public/items#show', as: 'item'

  post 'orders/confirm' => 'public/orders#confirm'
  get 'orders/complete' => 'public/orders#complete'

  delete 'cart_items/destroy_all' => 'public/cart_items#all_destroy', as: 'all_destroy'

  get 'customers/my_page' => 'public/customers#show'
  get 'customers/information/edit' => 'public/customers#edit'
  patch 'customers/information/edit' => 'public/customers#update'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe'
  patch 'customers/withdrawal' => 'public/customers#withdrawal', as: 'withdrawal'

  scope module: 'public' do
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :public do
  end

  namespace :admin do
    root to: "homes#top"
    resources :items
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
  end

  devise_for :customer,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
