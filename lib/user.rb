class User < ActiveRecord::Base
    has_many :projects
    has_many :developers, through: :projects
end