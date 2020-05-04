class User < ActiveRecord::Base[5.0]
    has_many :projects
    has_many :developers, through: :projects
end