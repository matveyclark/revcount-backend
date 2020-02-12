class Project < ApplicationRecord
    belongs_to :client
    belongs_to :project_manager

    has_many :revisions
end
