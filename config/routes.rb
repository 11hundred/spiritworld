Rails.application.routes.draw do

  devise_for :users

  resources :posts do
    resources :post_events
  end

  root 'posts#index'

end
