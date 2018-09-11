Rails.application.routes.draw do
  #define route for dasboard
  mount RailsAdmin::Engine => '/admin_dashboard', as: 'rails_admin'
  
  #user authentication routes
  devise_for :users

  #define the main route
  root to: 'home#landing' 
  
  #define welcome route
  get 'welcome', to: 'home#welcome', as: :onlyAdmin
end
