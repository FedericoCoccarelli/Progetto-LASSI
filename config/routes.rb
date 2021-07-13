Rails.application.routes.draw do
  get 'users/index'
  get 'user/index'


  match '/users' , to: 'users#index' , via: 'get' 




  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  #get 'questions/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get "/questions", to:"questions#index"
  root "questions#index"
  resources :users 
  resources :myquestions
  resources :answers
  resources :questions do
   resources :answers
  end

 resources :questiongoers
end
