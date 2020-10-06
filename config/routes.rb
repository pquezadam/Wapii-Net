Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
    

    authenticated :user do
      root 'main#index'
    end

    unauthenticated :user do
      devise_scope :user do
        root to: 'devise/sessions#new'
      end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
