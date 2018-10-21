Rails.application.routes.draw do
  scope "(:locale)", locale: /ja|en/ do
    devise_for :users
    root "static_pages#home"
    resources :static_pages
    resources :motels
    resources :rooms
    resources :equipments
  end
end
