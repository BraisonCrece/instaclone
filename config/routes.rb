Rails.application.routes.draw do
  resources :posts do
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

  get "/my_profile", to: "user#profile", as: :profile
  
  devise_for :users
  root "site#index"
end
