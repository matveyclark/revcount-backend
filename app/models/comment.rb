class Comment < ApplicationRecord
    belongs_to :revision
    belongs_to :user
end
