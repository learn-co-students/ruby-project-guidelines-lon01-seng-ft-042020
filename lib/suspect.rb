class Suspect < ActiveRecord::Base
    has_many :case_suspects
    has_many :cases, through: :case_suspects

    def my_cases 
        self.cases.map {|c| c.title}
    end 
end