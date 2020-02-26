class RevisionController < ApplicationController

    def create
        revision = Revision.new(revision_params)
        revision[:status] = 'in progress'
        revision.save
        if revision
            render json: { status: revision.status, created_at: revision.created_at, updated_at: revision.updated_at, description: revision.description, id: revision.id }, status: 200
        else
            render json: { error: "Something went wrong..." }, status: 401
        end
    end

    private

    def revision_params
        params.required(:revision).permit(:description, :project_id)
    end

end