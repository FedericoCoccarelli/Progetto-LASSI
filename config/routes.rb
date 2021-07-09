Rails.application.routes.draw do
  devise_for :users
  #get 'questions/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get "/questions", to:"questions#index"
  root "questions#index"
  resources :questions do
   resources :answers
  end

 resources :questiongoers
end
