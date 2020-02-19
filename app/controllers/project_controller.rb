class ProjectController < ApplicationController

    def show
        project = Project.find_by(id: params[:id])
        if project
            render json: { status: "success", data: project.revisions }, status: 200
        else
            render json: { error: "Please provide a valid project id." }, status: 401
        end
    end

end