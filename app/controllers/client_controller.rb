class ClientController < ApplicationController

    def create
        begin
            client = Client.create(client_params)
            render json: { status: "success", data: client, token: issue_token({ id: client.id }) }, status: 201
        rescue
            render json: { error: "Please enter valid inputs to regsiter." }, status: 401
        end
    end

    def show
        client = Client.find_by(id: params[:id])
        if client
            render json: { status: "success", data: client }
        else
            render json: { error: "There is no client with that ID." }
        end
    end

    def login
        client = Client.find_by(email: client_params[:email])
        if client && client.authenticate(client_params[:password])
            render json: { status: "success", user: client.email, token: issue_token({ id: client.id })}, status: 200
        else
            render json: { error: "Incorrect password or username."}, status: 401
        end
    end

    private

    def client_params
        params.require(:client).permit(:first_name, :last_name, :email, :password)
    end

end