class Developer < ActiveRecord::Base[5.0]
    has_many :projects
    has_many :users, through: :projects
end