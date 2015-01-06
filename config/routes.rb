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
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
    end
  end
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
