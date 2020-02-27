class User < ApplicationRecord
    has_secure_password

    has_many :clients
    has_many :project_managers
    has_many :comments

    validates_presence_of :first_name, :last_name, :email, :password
    validates :email, :uniqueness => true
end
