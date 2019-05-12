Rails.application.routes.draw do
  resources :user_surveys
  devise_for :users
  resources :survey_responses
  resources :survey_questions
  resources :surveys
  resources :categories
  resources :question_responses
  resources :responses
  resources :questions
  # resources :users

  root 'surveys#survey'
  get '/summary', to: 'surveys#summary'
  get '/user_summary', to: 'users#user_summary'
  get '/about', to: 'static#about'
  get '/eventbrite', to: 'static#eventbrite'

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  
end
