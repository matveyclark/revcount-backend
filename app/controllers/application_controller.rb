class ApplicationController < ActionController::API

    def validate
        if decoded_token["user_type"] == 'client'
            client = get_current_client
            if client
                render json: { status: "success", email: client.email, user_type: 'client', token: issue_token({ id: client.id, user_type: 'client' })}
            else
                render json: { error: "You are not authorized to view this page." }, status: 401
            end
        else 
            project_manager = get_current_project_manager
            if project_manager
                render json: { status: "success", email: project_manager.email, user_type: 'pm', token: issue_token({ id: project_manager.id, user_type: 'pm' })}, status: 200
            else
                render json: { error: "You are not authorized to view this page. Please log in." }, status: 401
            end
        end
    end

    def login
        if params.has_key?('client')
            client = Client.find_by(email: params[:client][:email])
            if client && client.authenticate(params[:client][:password])
                render json: { status: "success", user: client.email, user_type: 'client', token: issue_token({ id: client.id, user_type: 'client' })}, status: 200
            else
                render json: { error: "Incorrect password or username."}, status: 401
            end
        else
            project_manager = ProjectManager.find_by(email: params[:email])
            if project_manager && project_manager.authenticate(params[:password]) 
                render json: { status: "success", email: project_manager.email, user_type: 'pm', token: issue_token({ id: project_manager.id, user_type: 'pm' })}, status: 200
            else
                render json: { error: "Please enter the correct login details." }
            end
        end
    end

    def get_current_client
        id = decoded_token['id']
        Client.find_by(id: id)
    end

    def get_current_project_manager
        id = decoded_token['id']
        ProjectManager.find_by(id: id)
    end

    def decoded_token
        begin
            JWT.decode(token, secret, false).first
        rescue
            {}
        end
    end

    def token
        request.headers["authorization"]
    end

    def issue_token(payload)
        JWT.encode(payload, secret)
    end

    def secret
        ENV["MY_SECRET"]
    end
end
