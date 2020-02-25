class ProjectController < ApplicationController

    def create
        client = User.find_by(email: project_params[:email])
        if client == nil
            return render json: { error: 'Please enter a valid user email.' }, status: 401
        end
        project_manager = get_current_user.project_managers.first
        project = Project.new(name: project_params[:name], max_revisions: project_params[:max_revisions])
        client = client.clients.first
        project[:client_id] = client.id
        project[:project_manager_id] = project_manager.id
        project[:status] = 'in progress'
        project.save
        if project 
            render json: { status: "success", project: project }, status: 200
        elsif
            render josn: { error: "An error has occured..."}
        end
    end

    def show
        project = Project.find_by(id: params[:id])
        if project
            render json: { status: "success", data: project.revisions }, status: 200
        else
            render json: { error: "Please provide a valid project id." }, status: 401
        end
    end

    def invite
        project_manager = get_current_user.project_managers.first
        UserMailer.welcome_email(params[:email], project_manager).deliver_later
        render json: { message: "Email sent", status: "success" }, status: 200
    end

    def project_params
        params.require(:project).permit(:name, :max_revisions, :email)
    end

end