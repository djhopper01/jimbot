Rails.application.routes.draw do
  resources :reminders

  root 'reminders#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
