class ApplicationController < ActionController::API

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
