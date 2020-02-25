class Comment < ApplicationRecord
    belongs_to :revision
    belongs_to :user

    has_one_attached :screenshot
end
