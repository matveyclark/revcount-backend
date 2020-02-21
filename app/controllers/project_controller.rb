class ProjectController < ApplicationController

    def create
        client = User.find_by(email: project_params[:email])
        project_manager = get_current_user.project_managers.first
        project = Project.new(name: project_params[:name], max_revisions: project_params[:max_revisions])
        project[:client_id] = client.id.to_s
        project[:project_manager_id] = project_manager.id
        project[:status] = 'in progress'
        project.save
        render json: { status: "success", project: project }, status: 200
    end

    def show
        project = Project.find_by(id: params[:id])
        if project
            render json: { status: "success", data: project.revisions }, status: 200
        else
            render json: { error: "Please provide a valid project id." }, status: 401
        end
    end

    def project_params
        params.require(:project).permit(:name, :max_revisions, :email)
    end

end