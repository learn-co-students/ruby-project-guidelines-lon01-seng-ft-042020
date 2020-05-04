class Project < ActiveRecord::Base[5.0]
    belongs_to :users
    belongs_to :developers
end