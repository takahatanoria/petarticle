Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles do
    resources :comments, only: [:create, :show, :destroy]
    # collection do
    #   get ':categories'  => 'articles#category', as: 'category'
    # end
  end

  resources :users, only: [:index, :edit, :update, :show, :destroy]

  resources :categories, only: [:index] do
    collection do
      get 'walk'  => 'categories#walk'
      get 'discipline'  => 'categories#discipline'

      
    end
  end  


end
