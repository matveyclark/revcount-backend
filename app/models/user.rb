class User < ApplicationRecord
    has_secure_password

    has_many :clients
    has_many :project_managers
    has_many :comments
end
