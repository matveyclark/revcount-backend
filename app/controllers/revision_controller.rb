class RevisionController < ApplicationController

    def create
        revision = Revision.new(revision_params)
        revision[:status] = 'in progress'
        revision.save
    end

    private

    def revision_params
        params.required(:revision).permit(:description, :project_id)
    end

end