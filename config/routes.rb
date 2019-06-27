Rails.application.routes.draw do
  resources :user_surveys
  resources :survey_responses
  resources :survey_questions
  resources :surveys
  resources :categories
  resources :question_responses
  resources :responses
  resources :questions
  resources :users

  get '/register', to: 'users#new'
  get '/login', to: 'users#login'
  root 'surveys#survey'
  get '/summary', to: 'surveys#summary'
  get '/user_summary', to: 'users#user_summary'
  get '/about', to: 'static#about'
  get '/eventbrite', to: 'static#eventbrite'

  get '/img_url/:id', to: 'static#img_url'
 
  
end
