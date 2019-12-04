Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles do
    resources :comments, only: [:create, :show, :destroy]
    collection do
      # get ':latest'  => 'articles#latest', as: 'latest'
      # get ':ranking' => 'articles#ranking', as: 'ranking'
      # get ':search' => 'articles#search', as: 'search'
    end
  end

  resources :users, only: [:index, :edit, :update, :show, :destroy]

  resources :categories do
    collection do
      get 'walk'  => 'categories#walk'
      get 'discipline'  => 'categories#discipline'
      get 'sick'  => 'categories#sick'
      get 'life'  => 'categories#life'
      get 'food'  => 'categories#food'
      get 'rearing'  => 'categories#rearing'
      get 'question'  => 'categories#question'
      get 'story'  => 'categories#story'
      get 'petloss'  => 'categories#petloss'
      get 'other'  => 'categories#other'
    end
  end  

  resources :genres do
    collection do
      get 'dog'  => 'genres#dog'
      get 'cat'  => 'genres#cat'
      get 'small_animal'  => 'genres#small_animal'
      get 'bird'  => 'genres#bird'
      get 'fish'  => 'genres#fish'
      get 'reptile'  => 'genres#reptile'
      get 'genre_other'  => 'genres#genre_other'
    end
  end  

  resources :details do
    collection do
      get 'latest'  => 'details#latest'
      get 'ranking'  => 'details#ranking'
      get 'search'  => 'details#search'
    end
  end
  


end
