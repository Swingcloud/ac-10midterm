Rails.application.routes.draw do
  devise_for :users
  resources :emergencies do
  	resources :responses , :controller => 'emergency_replies'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "emergencies#index"
end
