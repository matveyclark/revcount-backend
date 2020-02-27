class RevisionController < ApplicationController

    def create
        revision = Revision.new(revision_params)
        revision[:status] = 'in progress'
        revision.save
        if revision.valid? 
            if revision
                render json: { status: revision.status, created_at: revision.created_at, updated_at: revision.updated_at, description: revision.description, id: revision.id }, status: 200
            else
                render json: { error: "Something went wrong..." }, status: 401
            end
        else
            render json: { error: revision.errors.full_messages }, status: 401
        end
    end

    def update
        revision = Revision.find_by(id: params[:id])
        revision.update(status: revision_params[:status])
        if revision
            render json: { status: "success", data: revision }, status: 200
        else
            render json: { error: "Revision did not update" }, status: 404
        end
    end

    private

    def revision_params
        params.required(:revision).permit(:description, :project_id, :status)
    end

end