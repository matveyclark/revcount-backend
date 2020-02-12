Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Project Manager routes
  # Route to register a new project manager
  post '/register-pm' => 'project_manager#create'
  get '/project-manager/:id' => 'project_manager#show'
  post '/login-pm' => 'project_manager#login'
  get '/validate-pm' => 'project_manager#validate'
end
