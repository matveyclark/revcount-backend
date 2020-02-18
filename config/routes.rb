Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Global validation
  get '/validate' => 'application#validate'
  post '/login' => 'application#login'

  # Project Manager routes
  post '/register/pm' => 'project_manager#create'
  get '/project-manager/:id' => 'project_manager#show'
  get '/projects/pm' => 'project_manager#projects'
  get '/clients/pm' => 'project_manager#clients'

  # Client routes
  post '/register' => 'client#create'
  get '/client/:id' => 'client#show'
  get '/projects' => 'client#projects'

  # Project routes
  get '/project/revisions' => 'project#revisions'
end
