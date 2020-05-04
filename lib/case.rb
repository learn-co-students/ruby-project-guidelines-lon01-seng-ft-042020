class Case < ActiveRecord::Base
    belongs_to :detective
    has_many :suspects, through: :case_suspects

    def self.detectives
        Case.all.map{|c| c.detective}
    end

    def suspects
        CaseSuspect.all.map{|cs| cs.suspect}
    end

    
        



end