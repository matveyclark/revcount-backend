class CommentController < ApplicationController

    def index
        revision = Revision.find_by(id: params[:id])
        if revision
            render json: { status: "success", comments: revision.comments }, status: 200
        else
            render json: { error: "An error has occured" }, status: 401
        end
    end
end