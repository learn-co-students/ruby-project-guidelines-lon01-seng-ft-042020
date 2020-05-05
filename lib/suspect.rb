class Suspect < ActiveRecord::Base
    has_many :case_suspects
    has_many :cases, through: :case_suspects

    def my_cases 
        self.cases.map {|c| c.title}
    end 

    # def drunk_people
    #     Suspect.all.where(drinks_alcohol: true).map{|susp| susp.name}
    # end

    # def into_tech
    #     Suspect.all.where(into_tech: true).map{|susp| susp.name}
    # end

    # def into_tech
    #     Suspect.all.where(into_tech: true).map{|susp| susp.name}
    # end

    # def speaks_a_lot
    #     Suspect.all.where(multilingual: true).map{|susp| susp.name}
    # end

end