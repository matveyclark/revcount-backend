class CommentController < ApplicationController

    def index
        revision = Revision.find_by(id: params[:id])
        comments = []
        revision.comments.each do |comment| 
           commentHash = { content: comment.content, user: comment.user.first_name }
           if comment.user.clients.length > 0
                commentHash[:user_type] = 'client'
           else 
                commentHash[:user_type] = 'pm'
           end
           comments.push(commentHash)
        end
        if revision 
            render json: { status: "success", comments: comments }, status: 200
        else
            render json: { error: "An error has occured" }, status: 401
        end
    end

    def create
        user = User.find_by(email: comment_params[:user])
        comment = Comment.create(content: comment_params[:content], revision_id: comment_params[:revision_id], user_id: user.id)
        if comment && user.clients.length > 0
            render json: { status: "success", data: comment.content, user: user.first_name, user_type: 'client' }, status: 200 
        else
            render json: { status: "success", data: comment.content, user: user.first_name, user_type: 'pm' }, status: 200
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :revision_id, :user)
    end
end