class CliApp
    system('clear')
    attr_reader :prompt

    def initialize
        @prompt = TTY::Prompt.new
    end

    def display_suspects
        spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :arrow_pulse)
        puts "    Current list of Suspects:".bold
        spinner.auto_spin
        sleep(3)
        Suspect.all.each do |suspect|
            puts "------------------------------".yellow
            puts "       #{suspect.name}".white.bold
        end
        spinner.stop('DONE!')
        
        nil
    end

    def delete_suspect
        spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :bouncing_ball)
        @prompt.error("     Careful! Once you deleted a suspect, YOU MAY let a criminal scape!!!")
        choices = Suspect.all.map{|suspect|{name: suspect.name, value: suspect}}
        choice = @prompt.select("   Choose one suspect to delete from the list:", choices)
        spinner.auto_spin
        sleep(2)
        prompt.warn("   You are letting #{choice.name} escape right now!")
        sleep(2)
        spinner.stop("!DONE!")
        prompt.error("#{choice.name} has gone to play videogame in a private Island!")
        choice.destroy
        
        nil
    end

    def another_delete?
        choice = @prompt.yes?('     Do you want to delete another suspect?')
        spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :toggle)
        spinner.auto_spin
        sleep(2)
        if choice
            delete_suspect
        end 
        spinner.stop("! - DONE - !")
        nil
    end

    def method
        d1 = Detective.new
        spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :toggle)
        c = ["suspects_over_age", "suspects_by_location", "suspects_by_gender", "suspects_by_hair_color", "drunk_people", "into_tech", "speaks_a_lot", "one_thing_about_me"]
        @prompt.warn("      Choose one method to help you on the next desicion. BE SMART!")
        choice = @prompt.select("CHOICE =", c)

        if choice == "suspects_over_age"
            answer = prompt.ask('   Tell over what age do you wanna see the suspects?')
            spinner.auto_spin
            sleep(4)
            @prompt.ok(d1.suspects_over_age(answer))
            spinner.stop("! - DONE - !")
            
            nil 
        elsif 
            choice == "suspects_by_location"
            answer = prompt.ask('   Tell what city you wanna look for the suspects!')
            spinner.auto_spin
            sleep(4)
            @prompt.ok(d1.suspects_by_location(answer))
            spinner.stop("! - DONE - !")
            
            nil 
        elsif 
            choice == "suspects_by_hair_color"
            answer = prompt.ask('   What hair color are you looking for?')
            spinner.auto_spin
            sleep(4)
            @prompt.ok(d1.suspects_by_hair_color(answer))
            spinner.stop("! - DONE - !")
            
            nil 
        elsif
            choice == "drunk_people"
            @prompt.ok("    These are people that drinks regulary!!!")
            spinner.auto_spin
            sleep(4)
            @prompt.ok(d1.drunk_people)
            spinner.stop("  ! - DONE - !")
            
            nil 
        elsif    
            choice == "into_tech"
            @prompt.ok("    They are nerds!!!")
            spinner.auto_spin
            sleep(4)
            @prompt.ok(d1.into_tech)
            spinner.stop("  ! - DONE - !")
            
            nil 
        elsif    
            choice == "speaks_a_lot"
            @prompt.ok("    Those who speaks more than one language")
            spinner.auto_spin
            sleep(4)
            @prompt.ok(d1.speaks_a_lot)
            spinner.stop("  ! - DONE - !")
            
            nil 
        elsif    
            choice == "one_thing_about_me"
            answer = prompt.ask('   What person do you wanna know about?')
            spinner.auto_spin
            sleep(4)
            @prompt.ok(d1.one_thing_about_me(answer))
            spinner.stop("  ! - DONE - !")
            
            nil
        elsif    
            choice == "suspects_by_gender"
            answer = prompt.ask('   What gender are you looking for?')
            spinner.auto_spin
            sleep(4)
            @prompt.ok(d1.suspects_by_gender(answer))
            spinner.stop("  ! - DONE - !")
            nil
        end
    end

    def turn
        display_suspects
        sleep(2)
        choice = @prompt.yes?("We are going to filter our suspects, do you want to find out more?") 
            if choice
                 method
            end
        sleep(2)
        delete_suspect
        sleep(2)
        another_delete?
        sleep(2)        
        system('clear')
    end

    def game

        #welcome.....
        #tell story...
        #turn
        #tell more story
        #turn
    end

end