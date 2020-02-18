class UserController < ApplicationController

    def create
        user = User.create(user_params)
        if params[:user][:user_type] == 'client'
            client = Client.create(user: user)
            render json: { status: "success", data: user, user_type: 'client', token: issue_token({ id: user.id  }) }, status: 201
        else
            pm = ProjectManager.create(user: user)
            render json: { status: "success", data: user, user_type: 'pm', token: issue_token({ id: user.id }) }, status: 201
        end
    end

    def login
        user = User.find_by(email: user_params[:email])
        if user && user.authenticate(user_params[:password])
            if user.clients.length > 0
                render json: { status: "success", user: user.email, user_type: 'client', token: issue_token({ id: user.id })}, status: 200
            else
                render json: { status: "success", user: user.email, user_type: 'pm', token: issue_token({ id: user.id })}, status: 200
            end
        else
            render json: { error: "Incorrect password or username."}, status: 401
        end
    end

    def validate
        user = get_current_user
        if user
            if user.clients.length > 0
                render json: { status: "success", email: user.email, user_type: 'client', token: issue_token({ id: user.id })}
            else
                render json: { status: "success", email: user.email, user_type: 'pm', token: issue_token({ id: user.id })}, status: 200
            end
        else
            render json: { error: "You are not authorized to view this page. Please log in." }, status: 401
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :company_name)
    end

end