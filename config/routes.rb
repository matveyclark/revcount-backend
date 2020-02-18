Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # User validation
  get '/validate' => 'user#validate'
  post '/login' => 'user#login'
  post '/register' => 'user#create'

  # Project Manager routes
  get '/project-manager/:id' => 'project_manager#show'
  get '/projects/pm' => 'project_manager#projects'
  get '/clients/pm' => 'project_manager#clients'

  # Client routes
  get '/client/:id' => 'client#show'
  get '/projects' => 'client#projects'

  # Project routes
  get '/project/revisions' => 'project#revisions'
end
