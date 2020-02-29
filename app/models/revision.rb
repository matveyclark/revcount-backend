class Revision < ApplicationRecord
    belongs_to :project
    has_many :comments

    validates_presence_of :description, :content
end
