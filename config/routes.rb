Rails.application.routes.draw do
  resources :affiliations
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
  post '/register', to: 'users#create'
  
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/summary', to: 'surveys#summary'
  get '/user_summary', to: 'users#user_summary'
  get '/users_report', to: 'users#users_report'
  get '/reset_password/:id', to: 'users#reset_password'

  get '/about', to: 'static#about'
  get '/eventbrite', to: 'static#eventbrite'
  get '/img_url/:id', to: 'static#img_url'
  

  post '/users', to: 'users#update'

  root 'surveys#survey'
  
end
