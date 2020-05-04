class CaseSuspect < ActiveRecord::Base
    belongs_to :suspect
    belongs_to :case
end