Rails.application.routes.draw do
  devise_for :users
  resources :survey_responses
  resources :survey_questions
  resources :surveys
  resources :categories
  resources :question_responses
  resources :responses
  resources :questions
  resources :users

  root 'surveys#survey'
  get '/summary', to: 'surveys#summary'
  get '/about', to: 'surveys#about'
  get '/eventbrite', to: 'surveys#eventbrite'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
