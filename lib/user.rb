class User < ActiveRecord::Base
    has_many :bookings
    has_many :properties, through: :bookings

    # def new_user(reply)
    #     puts "Please enter your name"
    #     reply = user_input
    #     User.create(name: reply)
        
    # end

    # def returning_user(reply)
    #     puts "Please enter your name"
    #     reply = user_input
    #     User.all.find{|user| user.name == reply}
    # end
    
end