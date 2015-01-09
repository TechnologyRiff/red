Bloccit::Application.routes.draw do

  get 'comments/index'

  get 'comments/edit'

  get 'comments/create'

  get 'comments/show'

  get 'topics/index'

  get 'topics/new'

  get 'topics/show'

  get 'topics/edit'

  devise_for :users
    resources :users, only: [:update]
  resources :topics do
    resources :posts, except: [:index] 
  end

    resources :posts, only: [] do
      resources :comments, only: [:create, :destroy]

      post '/up-vote' => 'votes#up_vote', as: :up_vote
      post '/down-vote' => 'votes#down_vote', as: :down_vote
      
    end
    
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
