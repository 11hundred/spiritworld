Rails.application.routes.draw do

  devise_for :users

  resources :posts do
    resources :post_events
  end

  get 'feed' => 'posts#feed'

  root 'posts#index'

end
