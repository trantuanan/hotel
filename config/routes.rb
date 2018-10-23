Rails.application.routes.draw do
  scope "(:locale)", locale: /ja|en/ do
    devise_for :users
    root "static_pages#home"
    resources :motels
    resources :rooms
    resources :equipments
    resources :reviews do
      resources :comments
    end
    resources :comments do
      resources :comments
    end
  end
end
