Rails.application.routes.draw do
  devise_for :users, 
  controllers: {
   registrations: 'users/registrations' ,
   omniauth_callbacks: 'users/omniauth_callbacks'
   }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles do
    resources :comments, only: [:create, :destroy]
    # post "likes/:article_id/create"  => "likes#create"
    # delete "likes/:article_id/destroy"  => "likes#destroy"
    # post "likes/:article_id/topcreate"  => "likes#topcreate"
    # delete "likes/:article_id/topdestroy"  => "likes#topdestroy"

  end

  post "likes/:article_id/create"  => "likes#create"
  delete "likes/:article_id/destroy"  => "likes#destroy"
  post "likes/:article_id/topcreate"  => "likes#topcreate"
  delete "likes/:article_id/topdestroy"  => "likes#topdestroy"

  # post "likes/:article_id/create"  => "likes#create"
  # delete "likes/:article_id/destroy"  => "likes#destroy"

  # resources :likes, only: [:create]

  resources :users, only: [:index, :edit, :update, :show, :destroy] do
    get "likes" => "users#likes"
  end  

  resources :signup do
    collection do
      get 'entry_signup'
      get 'step1'
      get 'step2'
      get 'step3'# ここで、入力の全てが終了する
      get 'step4'
      get 'done' # 登録完了後のページ
    end
  end

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
