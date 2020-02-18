class ProjectManagerController < ApplicationController

    def show
        begin
            project_manager = ProjectManager.find(params[:id])
            render json: { status: "success", data: project_manager, user_type: 'pm' }, status: 200
        rescue
            render json: { error: "A project manager with that ID could not be found." }, status: 404
        end
    end

    def projects
        project_manager = get_current_project_manager
        if project_manager
            render json: project_manager.projects, status: 200
        else
            render json: { error: "You are not authorized to view this page. Please log in."}, status: 401
        end
    end

    def clients
        project_manager = get_current_project_manager
        if project_manager
            render json: project_manager.clients, :except => [:password_digest, :created_at, :updated_at], status: 200
        else
            render json: { error: "You are not authorized to view this page. Please log in."}, status: 401
        end
    end

    private

    def project_manager_params
        params.require(:project_manager).permit(:first_name, :last_name, :email, :password, :company_name)
    end
end