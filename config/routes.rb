Rails.application.routes.draw do

  # get 'auth/github', as: 'auth_path'
  root to: 'home#index'
  # session new as root?
end
