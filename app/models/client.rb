class Client < ApplicationRecord
    has_many :projects
    belongs_to :user
    has_many :project_managers, through: :projects
end
