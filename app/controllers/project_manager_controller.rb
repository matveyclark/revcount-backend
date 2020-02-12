class ProjectManagerController < ApplicationController

    def create
        begin
            project_manager = ProjectManager.create(project_manager_params)
            render json: { status: "success", data: project_manager, token: issue_token({ id: project_manager.id }) }, status: 201
        rescue
            render json: { error: "Please enter valid inputs" }, status: 401
        end
    end

    def show
        begin
            project_manager = ProjectManager.find(params[:id])
            render json: { status: "success", data: project_manager }, status: 200
        rescue
            render json: { error: "A project manager with that ID could not be found." }, status: 404
        end
    end

    def login
        project_manager = ProjectManager.find_by(email: project_manager_params[:email])
        if project_manager && project_manager.authenticate(project_manager_params[:password]) 
            render json: { status: "success", email: project_manager.email, token: issue_token({ id: project_manager.id })}, status: 200
        else
            render json: { error: "Please enter the correct login details." }
        end
    end

    def validate
        project_manager = get_current_project_manager
        if project_manager
            render json: { status: "success", email: project_manager.email, token: issue_token({ id: project_manager.id })}, status: 200
        else
            render json: { error: "You are not authorized to view this page. Please log in." }, status: 401
        end
    end

    private

    def project_manager_params
        params.require(:project_manager).permit(:first_name, :last_name, :email, :password, :company_name)
    end
end