class CommentController < ApplicationController

    def index
        revision = Revision.find_by(id: params[:id])
        if revision
            render json: { status: "success", comments: revision.comments }, status: 200
        else
            render json: { error: "An error has occured" }, status: 401
        end
    end

    def create
        user = User.find_by(email: comment_params[:user])
        comment = Comment.create(content: comment_params[:content], revision_id: comment_params[:revision_id], user_id: user.id)
        if comment
            render json: { status: "success", data: comment }, status: 200
        else
            render json: { error: "Something went wrong..." }, status: 401
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :revision_id, :user)
    end
end