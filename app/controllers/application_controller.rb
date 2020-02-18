class ApplicationController < ActionController::API

    def get_current_user
        id = decoded_token['id']
        User.find_by(id: id)
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
