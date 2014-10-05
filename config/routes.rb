Rails.application.routes.draw do
  resources :reminders

  root 'reminders#index'
end
