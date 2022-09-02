Rails.application.routes.draw do
  resources :posts, only: [:create, :new] do
    resources :likes, only: :create do
      collection do
        delete :destroy
      end
    end
    resources :comments, only: [:create, :new] do
      resources :likes, only: :create do
        collection do
          delete :destroy
        end
      end
    end
  end

  # # resources :likes

  # post 'likes/:id', to: 'likes#create', as: :likes
  # delete 'likes/:id', to: 'likes#delete', as: :delete_likes
  #   # resources :comments
  #   # resources :posts
  #   # collection do
  #   #   delete :destroy
  #   # end
  # # end
  
  devise_for :users
  root "site#index"
end
