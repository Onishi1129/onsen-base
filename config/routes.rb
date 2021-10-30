Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:index, :show, :edit, :update]
  resources :posts, only: [:edit, :create, :index, :show, :update, :destroy] do
    collection do
      get '/posts/search', to: 'posts#search'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
