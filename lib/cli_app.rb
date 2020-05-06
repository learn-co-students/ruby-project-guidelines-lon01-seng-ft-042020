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
        activities_on_island = ["play video games", "play tennis", "fly planes", "learn how to salsa", "swim with dolphins"]
        spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :bouncing_ball)
        @prompt.error("     Careful! Once you deleted a suspect, YOU MAY let a criminal escape!!!")
        choices = Suspect.all.map{|suspect|{name: suspect.name, value: suspect}}
        choice = @prompt.select("   Choose one suspect to delete from the list:", choices)
        spinner.auto_spin
        sleep(2)
        prompt.warn("   You are letting #{choice.name} escape right now!")
        sleep(2)
        spinner.stop("!DONE!")
        prompt.error("#{choice.name} has gone to #{activities_on_island.sample} on a private island!")
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
        @d1 = Detective.new
        @spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :toggle)
        c = ["suspects_over_age", "suspects_by_location", "suspects_by_gender", "suspects_by_hair_color", "drunk_people", "into_tech", "speaks_a_lot", "one_thing_about_me"]
        @prompt.warn("      Choose one method to help you on the next desicion. BE SMART!")
        choice = @prompt.select("CHOICE =", c)

        if choice == "suspects_over_age"
            suspects_over_age?
        elsif 
            choice == "suspects_by_location"
            suspects_by_location?
        elsif 
            choice == "suspects_by_hair_color"
            suspects_by_hair_color?
        elsif
            choice == "drunk_people"
            drunk_people?
        elsif    
            choice == "into_tech"
            into_tech?
        elsif    
            choice == "speaks_a_lot"
            speaks_a_lot?
        elsif    
            choice == "one_thing_about_me"
            one_thing_about_me?
        elsif    
            choice == "suspects_by_gender"
            suspects_by_gender?
        end
    end

    def suspects_over_age?
        answer = prompt.ask('   Suspects over what age would you like to see?')
        @spinner.auto_spin
        sleep(4)
        @prompt.ok(@d1.suspects_over_age(answer))
        @spinner.stop("! - DONE - !")
        nil 
    end

    def suspects_by_location?
        answer = prompt.ask('   What city would you like to look for the suspects?')
        @spinner.auto_spin
        sleep(4)
        @prompt.ok(@d1.suspects_by_location(answer))
        if @d1.suspects_by_location(answer).length == 0
            prompt.error("There are no suspects in that location!")
            @spinner.stop("! - DONE - !")
            method
        end
        @spinner.stop("! - DONE - !")
        nil 
    end 

    def suspects_by_hair_color?
        answer = prompt.ask('   What type of hair color are you looking for?')
        @spinner.auto_spin
        sleep(4)
        @prompt.ok(@d1.suspects_by_hair_color(answer))
        if @d1.suspects_by_hair_color(answer).length == 0
            prompt.error("There are no suspects with this hair color!")
            @spinner.stop("! - DONE - !")
            method
        end
        @spinner.stop("! - DONE - !")
        nil 
    end 

    def drunk_people?
        @prompt.ok("    These are the regular drinkers!")
        @spinner.auto_spin
        sleep(4)
        @prompt.ok(@d1.drunk_people)
        @spinner.stop("  ! - DONE - !")    
        nil 
    end 

    def into_tech?
        @prompt.ok("    These are the computer nerds!!!")
        @spinner.auto_spin
        sleep(4)
        @prompt.ok(@d1.into_tech)
        @spinner.stop("  ! - DONE - !")
        nil 
    end 

    def speaks_a_lot?
        @prompt.ok("    These guys speak more than one language!")
        @spinner.auto_spin
        sleep(4)
        @prompt.ok(@d1.speaks_a_lot)
        @spinner.stop("  ! - DONE - !") 
        nil 
    end 

    def one_thing_about_me?
        answer = prompt.ask('   What person do you wanna know about? (Type in full name)')
        @spinner.auto_spin
        sleep(4)
        if Suspect.find_by(name: answer)
        @prompt.ok(@d1.one_thing_about_me(answer))
        @spinner.stop("  ! - DONE - !") 
        nil
        else
        @spinner.stop("  ! - DONE - !") 
        prompt.error("Incorrect name!")    
        one_thing_about_me?
        end
    end 

    def suspects_by_gender?         
        answer = prompt.ask('   What gender are you looking for? (F/M)')
        @spinner.auto_spin
        sleep(4)
        @prompt.ok(@d1.suspects_by_gender(answer))
        if @d1.suspects_by_gender(answer).length == 0
            prompt.error("There are no suspects with that gender!")
            @spinner.stop("! - DONE - !")
            method
        end
        @spinner.stop("! - DONE - !")
        nil 
    end 


    def turn
        display_suspects
        sleep(2)
        choice = @prompt.yes?("We are going to filter our suspects, do you want to find out more?") 
            if choice
                 method
            end
        choice2 = @prompt.yes?("Do you want to use another filter?") 
            if choice2
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
        intro
        beginning
        part_1
        turn
        part_2
        turn
        part_3
        turn 
        part_4
        turn 
        part_5
        turn
        part_6
        #end win/lose
    end

    def time
        time = Time.now
        time.strftime('%H:%M:%S, %a %d %b %Y')
    end

    

    def intro
        system('clear')
        spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :arrow_pulse)
        spinner.auto_spin
        sleep(5)
        puts WELCOME
        spinner.stop("  IMAGINE WE HAVE SOME MYSTERIOUS MUSIC PLAYING NOW!".yellow.bold)
        sleep(5)

        system('clear')
        spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :bouncing_ball)
        spinner.auto_spin
        puts BY
        sleep(6)
        spinner.stop("  WISH WE HAD A REALLY COOL MUSIC... ;-D".yellow.bold)
        nil
    end

    def beginning
        system('clear')
        username = prompt.ask("Please enter your name to begin the game.")
        puts "\n"
        puts "  Welcome, Detective #{username}. There has been a theft at Flatiron School."
        puts "\n"
        puts "  We know very little. Only that an important piece of tech was stolen from the campus, \n sometime in the last couple of hours. You are the first person to arrive at the crime \n scene at #{time}, but your Sergeant Chief has already rounded up a \n list of 15 suspects that have been known for this kind of theft before. These guys are \n renowned, the \e[36mStandard Deviants\e[0m of this kind of technological savvy. You are the \e[36mMethod Man\e[0m. \n
        It’s your job to suss out the culprit."
        @prompt.keypress("Press to continue...")
        puts "\n"
    end

    def part_1
        puts "  A thick fog permeates the London streets as you go over evidence from the case. \n The crime was committed right here, in London, so immediately you can strike \n off suspects that weren’t in the country."
    end

    def part_2
        puts "  You also know that the suspect must’ve been really into tech to attempt such an extraordinary feat."
    end

    def part_3
        puts "  Good. Now your investigations are under way. Your foot crunches down on the shattered \n glass as you make your way into the building, but you pause just as you reach the door. \n Something catches your eye. There’s a Tamagotchi lying on the floor. You pick it up. \n It looks important."
        puts ""
        sleep(4)
        @prompt.keypress("Press to continue...")
        puts "\n"
        puts "  The building had been closed for renovations for a few months now, so you tread with caution \n through the darkness, side-stepping pipes and displaced concrete. You check for movement, perhaps \n the thief is still lurking in the shadows, but you realise it’s a classic \e[36m404\e[0m: no-ones there."
        puts ""
        sleep(4)
        puts "\e[36mKeep Your Eyes on the Prys\e[0m, Detective."
        puts ""
        sleep(2)
        @prompt.keypress("Press to continue...")
        puts "\n"
        puts "  The smell of alcohol hits your nose. At first you pay no mind to it, but as you look closely, \n you can make something out at the far end of the room. It’s a half empty bottle of Bourbon. \n Interesting… Based on this new evidence, you choose to refine your suspect list even further."
    end

    def part_4
        @prompt.keypress("Press to continue...")
        puts "\n"
        puts "The perpetrator must’ve been here long enough to drink most of their drink, which means they had \n been waiting around for a suspicious amount of time.  What were they waiting for? Any \e[36mtwo-bit Schema\e[0m \n knows not to hang around at the scene of the crime. You think back to the Tamagotchi you found at \n the start of the scene of the crime. What was anyone doing with a Tamagotchi at a crime scene?"
        puts "\n"
        @prompt.keypress("Press to continue...")
        puts "\n"
        puts ""
        sleep(2)
        puts "You hazard a guess and infer that your suspect must be under 30 and they must be really into tech."
    end

    def part_5
        puts "\n"
        @prompt.keypress("Press to continue...")
        puts "\n"
        puts "\e[36mFork it\e[0m,  you think. There’s nothing left to be found here. You emerge from the building onto \n Finsbury Pavement. You are standing in the spill of a streetlight. To your right is Pret. \n To your left is Pret. And up ahead, sure as day, you see a Pret. Through the mist you see a \n quiet residential street, lined with newspapers. Something has been tossed onto the pavement – \n a scattered piece of paper, which you pick up and pocket."
        sleep(2)
        puts "\n"
        @prompt.keypress("Press to continue...")
        puts "\n"
        sleep(2)
        puts ""
        puts "Your phone rings. Word just in from the \e[36mCSS and Desist\e[0m Neighbourhood Watch. A woman was seen \n fleeing the scene of the crime. Let’s refine our suspect list a little further."
    end
    
    def part_6
        puts "\n"
        @prompt.keypress("Press to continue...")
        puts "\n"
        puts "You take another look at the paper you found on the floor. You focus your gaze and see subtle \n etchings on the envelope, as if someone had written something else on a paper on top of it. \n The nearly invisible scratches read…"
        puts ""
        sleep(6)
        puts "                 \e[95mI_Accidently_Drank_1lt_Energy_Drink\e[0m"
        puts ""
        sleep(3)
        @prompt.keypress("Press to continue...")
        sleep(2)
        puts "\n"        
        puts "Time to make some deductions about this note and it's sender... Could it be… the \e[36mgitface killahs\e[0m, \n who have an affinity for monster drinks? No. Don't go \e[36mJSON Waterfalls\e[0m. \n You take another look at your suspect list and realise it can only be…"
    end


end