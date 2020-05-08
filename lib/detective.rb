class Detective < ActiveRecord::Base
    has_many :cases
    has_many :case_suspects, through: :cases

    def suspects_by_case(case_name)
        self.cases.where(title: case_name)[0].suspects
    end
    
    def suspects_names(case_name) 
        suspects_by_case(case_name).map {|s| s.name}
    end
    
    def suspects_by_gender(gender)
        Suspect.all.where(gender: gender).map{|susp| susp.name}
    end

    def suspects_over_age(age)
        Suspect.all.where("age > ? ", age).map{|susp| susp.name}
        # suspects = suspects_by_case(case_name).select {|s| s.age > age}
        # suspects.map {|s| s.name}
        #nil
    end 

    def suspects_by_location(loc)
        Suspect.all.where(location: loc).map{|susp| susp.name}
        # suspects = suspects_by_case(case_name).select {|s| s.location == loc}
        # suspects.map {|s| s.name} 
        #nil
    end

    def suspects_by_hair_color(hair)
        Suspect.all.where(hair_color: hair).map{|susp| susp.name}
        # suspects = suspects_by_case(case_name).select {|s| s.hair_color == hair}
        # suspects.map {|s| s.name} 
        #nil
    end

    def drunk_people
        Suspect.all.where(drinks_alcohol: true).map{|susp| susp.name}
        #nil
    end

    def into_tech
        Suspect.all.where(into_tech: true).map{|susp| susp.name}
        #nil
    end

    def speaks_a_lot
        Suspect.all.where(multilingual: true).map{|susp| susp.name}
        #nil
    end

    def one_thing_about_me(name)
        Suspect.find_by(name: name).one_thing_about
    end
end


