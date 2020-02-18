class ProjectManager < ApplicationRecord

    has_many :projects
    has_many :clients, through: :projects
    belongs_to :user
end
