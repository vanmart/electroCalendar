Rails.application.routes.draw do
  #define route for dasboard
  mount RailsAdmin::Engine => '/admin_dashboard', as: 'rails_admin'
  
  #user authentication routes
  devise_for :users

  #define the main routes 
  authenticated :user do
    root to: 'home#welcome'
  end
  unauthenticated :user do
    root to: 'home#landing'
  end

  #define welcome route
  get 'welcome', to: 'home#welcome', as: :welcome
  get 'landing', to: 'home#landing', as: :landing
end
