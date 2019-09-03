Rails.application.routes.draw do
  resources :posts do
    resources :comments do
      member do
        patch :like
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
