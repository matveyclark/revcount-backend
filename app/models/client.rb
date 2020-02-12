class Client < ApplicationRecord
    has_secure_password

    has_many :projects
    has_many :project_managers, through: :projects
end
