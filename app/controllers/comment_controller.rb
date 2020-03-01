class CommentController < ApplicationController

    def index
        revision = Revision.find_by(id: params[:id])
        comments = []
        revision.comments.each do |comment| 
           commentHash = { content: comment.content, user: comment.user.first_name, screenshot: comment.screenshot.attached? }
           if comment.user.clients.length > 0 && comment.screenshot.attached?
                commentHash[:user_type] = 'client'
                commentHash[:screenshot_url] = comment.screenshot.service_url
           elsif comment.user.project_managers.length > 0 && comment.screenshot.attached? 
                commentHash[:user_type] = 'pm'
                commentHash[:screenshot_url] = comment.screenshot.service_url
           elsif comment.user.clients.length > 0
                commentHash[:user_type] = 'client'
           elsif comment.user.project_managers.length > 0
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
        user = User.find_by(email: params[:email])
        comment = nil
        if params[:screenshot] != 'null'
            comment = Comment.create(content: params[:content], revision_id: params[:revision],user_id: user.id, screenshot: params[:screenshot])
        else
            comment = Comment.create(content: params[:content], revision_id: params[:revision],user_id: user.id)
        end
        if comment.valid?
            if comment && user.clients.length > 0 && comment.screenshot.attached?
                render json: { status: "success", data: comment.content, user: user.first_name, user_type: 'client', screenshot: comment.screenshot.attached?, screenshot_url: comment.screenshot.service_url }, status: 200 
            elsif comment && user.project_managers.length > 0 && comment.screenshot.attached?
                render json: { status: "success", data: comment.content, user: user.first_name, user_type: 'pm', screenshot: comment.screenshot.attached?, screenshot_url: comment.screenshot.service_url }, status: 200
            elsif comment && user.clients.length > 0
                render json: { status: "success", data: comment.content, user: user.first_name, user_type: 'client', screenshot: comment.screenshot.attached? }, status: 200
            elsif comment && user.project_managers.length > 0 
                render json: { status: "success", data: comment.content, user: user.first_name, user_type: 'pm', screenshot: comment.screenshot.attached? }, status: 200
            end
        else
            render json: { error: comment.errors.full_messages }, status: 401
        end
    end
end