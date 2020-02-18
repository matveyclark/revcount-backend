class ClientController < ApplicationController

    def create
        begin
            client = Client.create(client_params)
            render json: { status: "success", data: client, user_type: 'client', token: issue_token({ id: client.id ,user_type: 'client' }) }, status: 201
        rescue
            render json: { error: "Please enter valid inputs to regsiter." }, status: 401
        end
    end

    def show
        client = Client.find_by(id: params[:id])
        if client
            render json: { status: "success", data: client, user_type: 'client' }
        else
            render json: { error: "There is no client with that ID." }
        end
    end

    def login
        client = Client.find_by(email: client_params[:email])
        if client && client.authenticate(client_params[:password])
            render json: { status: "success", user: client.email, user_type: 'client', token: issue_token({ id: client.id, user_type: 'client' })}, status: 200
        else
            render json: { error: "Incorrect password or username."}, status: 401
        end
    end

    def projects
        client = get_current_client
        if client 
            render json: client.projects, status: 200
        else
            render json: { error: "You are not authorized to view this page. Please log in."}, status: 401
        end 
    end

    private

    def client_params
        params.require(:client).permit(:first_name, :last_name, :email, :password)
    end

end