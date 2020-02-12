Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Project Manager routes
  post '/register/pm' => 'project_manager#create'
  get '/project-manager/:id' => 'project_manager#show'
  post '/login/pm' => 'project_manager#login'
  get '/validate/pm' => 'project_manager#validate'
  get '/projects/pm' => 'project_manager#projects'
  get '/clients/pm' => 'project_manager#clients'

  # Client routes
  post '/register' => 'client#create'
  get '/client/:id' => 'client#show'
  post '/login' => 'client#login'
  get '/validate' => 'client#validate'

  # Project routes
  
end
