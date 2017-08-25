Rails.application.routes.draw do
  root to: "search#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/search', to: 'search#find'
  get '/pagination', to: 'search#pagination' 

end
