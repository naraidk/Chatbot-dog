Rails.application.routes.draw do
  # Devise routes removed — provide minimal redirects so existing links don't 404
  get  '/users/sign_in',  to: redirect('/'), as: :new_user_session
  delete '/users/sign_out', to: redirect('/'), as: :destroy_user_session

  # root to: "pages#home"
  root "dogs#index"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :dogs do
    resources :chats, only: [:create]
  end

  resources :chats, only: [:index, :show] do
    resources :messages, only: [:new, :create, :show]
  end
end
