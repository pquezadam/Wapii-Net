Rails.application.routes.draw do
  resources :posts
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    post '/sign_up_validation', to: 'users/omniauth_callbacks#sign_up_validation'
  end
    

    authenticated :user do
      root 'posts#index'
    end

    unauthenticated :user do
      devise_scope :user do
        root to: 'devise/sessions#new'
      end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
