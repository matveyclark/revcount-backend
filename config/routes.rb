Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Global validation
  get '/validate' => 'application#validate'

  # Project Manager routes
  post '/register/pm' => 'project_manager#create'
  get '/project-manager/:id' => 'project_manager#show'
  post '/login/pm' => 'project_manager#login'
  get '/projects/pm' => 'project_manager#projects'
  get '/clients/pm' => 'project_manager#clients'

  # Client routes
  post '/register' => 'client#create'
  get '/client/:id' => 'client#show'
  post '/login' => 'client#login'
  get '/projects' => 'client#projects'

  # Project routes
  get '/project/revisions' => 'project#revisions'
  
end
