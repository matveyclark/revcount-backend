class ClientController < ApplicationController

    private

    def client_params
        params.require(:client).permit(:first_name, :last_name, :email, :password)
    end

end