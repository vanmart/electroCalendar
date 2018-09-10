Rails.application.routes.draw do
  devise_for :users
  root to: 'home#landing' 

  get 'welcome', to: 'home#welcome', as: :onlyAdmin
end
