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
    def suspects_over_age(age)
        Suspect.all.where("age > ? ", age).map{|susp| susp.name}

        # suspects = suspects_by_case(case_name).select {|s| s.age > age}
        # suspects.map {|s| s.name}
    end 

    #tells the suspects that lives in the selected city, you should pass location and case name as parameter! 
    def suspects_by_location(loc)
        Suspect.all.where(location: loc).map{|susp| susp.name}

        # suspects = suspects_by_case(case_name).select {|s| s.location == loc}
        # suspects.map {|s| s.name} 
    end

    def suspects_by_hair_color(hair)
        Suspect.all.where(hair_color: hair).map{|susp| susp.name}

        # suspects = suspects_by_case(case_name).select {|s| s.hair_color == hair}
        # suspects.map {|s| s.name} 
    end

    def drunk_people
        puts "Suspect(s) Name(s)"
        puts "___________________"
        Suspect.all.where(drinks_alcohol: true).map{|susp| susp.name}.each_with_index do |ele, i|
            puts "#{i+1}------- #{ele}"
        end
        nil
    end

    def into_tech
        Suspect.all.where(into_tech: true).map{|susp| susp.name}
    end

    def speaks_a_lot
        Suspect.all.where(multilingual: true).map{|susp| susp.name}
    end

    def one_thing_about_me(name)
        Suspect.find_by(name: name).one_thing_about
    end
end


