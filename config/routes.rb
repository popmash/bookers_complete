Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about',as:'about'

  resources :users, only:[:show,:index,:edit,:update,] do
     resource :relationships, only:[:create,:destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
      get "search", to: "users#search"
  end
  resources :chats, only:[:create, :show]
  resources :books, only:[:show, :destroy, :create, :index, :edit, :update] do
    resources :book_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  resources :groups do
    get "join" => "groups#join"
  end
  get "search" => "searches#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
