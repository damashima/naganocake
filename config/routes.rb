Rails.application.routes.draw do

  root 'public/homes#top'
  get 'about' => 'public/homes#about'
  resources :items, only: [:index, :show]
  resources :customers, only: [:show, :edit, :update]
  get 'customers/my_page' => 'public/customers#show'
  get 'customers/infomation/edit' => 'public/customers#edit'
  patch 'customers/infomation' => 'public/customers#update'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe'
  patch 'customers/withdrawal' => 'public/customers#withdrawal', as: 'withdrawal'

  namespace :public do
  end

  namespace :admin do
    root to: "homes#top"
    resources :items
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
  end

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
