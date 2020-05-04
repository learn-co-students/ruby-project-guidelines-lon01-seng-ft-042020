class Detective < ActiveRecord::Base
    has_many :cases
    has_many :case_suspects, through: :cases

    #tells you all the suspects related to the case, you should pass case name as parameter! 
    def suspects_by_case(case_name)
        self.cases.where(title: case_name)[0].suspects
    end
    
    #tells the names of the suspects related to the case, you should pass case name as parameter! 
    def suspects_names(case_name) 
        suspects_by_case(case_name).map {|s| s.name}
    end 

    #tells the suspects that are over the age you choose, you should pass age and case name as parameter! 
    def suspects_over_age(age, case_name)
        suspects = suspects_by_case(case_name).select {|s| s.age > age}
        suspects.map {|s| s.name}
    end 

    #tells the suspects that lives in the selected city, you should pass location and case name as parameter! 
    def suspects_by_location(loc, case_name)
        suspects = suspects_by_case(case_name).select {|s| s.location == loc}
        suspects.map {|s| s.name} 
    end
end


