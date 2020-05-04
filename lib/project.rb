class Project < ActiveRecord::Base
    belongs_to :users
    belongs_to :developers
end