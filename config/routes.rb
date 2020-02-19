Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # User validation
  get '/validate' => 'user#validate'
  post '/login' => 'user#login'
  post '/register' => 'user#create'

  # Projects
  get '/projects' => 'user#projects'
  get '/projects/:id' => 'project#show'
  
end
