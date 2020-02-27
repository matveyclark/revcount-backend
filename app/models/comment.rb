class Comment < ApplicationRecord
    belongs_to :revision
    belongs_to :user

    has_one_attached :screenshot

    validates_presence_of :content
end
