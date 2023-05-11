Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about',as:'about'
  
  resources :users, only:[:show,:index,:edit,:update,]
  resources :books, only:[:show, :destroy, :create, :index, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
