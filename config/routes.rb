Rails.application.routes.draw do
  root to: 'spots#index'
  devise_for :users
  resources :users, only:[:show, :edit, :update]
  resources :spots do
    collection do
      get :search_prefecture
    end
    resources :comments, only:[:create, :destroy]
  end
end
