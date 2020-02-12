class ProjectManager < ApplicationRecord
    has_secure_password

    has_many :projects
    has_many :clients, through: :projects
end
