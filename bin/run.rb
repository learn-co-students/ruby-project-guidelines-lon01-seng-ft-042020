require_relative '../config/environment'
require 'pry'
prompt = TTY::Prompt.new
cli = CliApp.new
BY = File.read('lib/by.txt')
WELCOME = File.read('lib/welcome.txt')


system('clear')

# spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :arrow_pulse)
# spinner.auto_spin
# sleep(5)
# puts WELCOME
# spinner.stop("  IMAGINE WE HAVE SOME MYSTERIOUS MUSIC PLAYING NOW!".yellow.bold)
# sleep(5)

# system('clear')
# spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :bouncing_ball)
# spinner.auto_spin
# puts BY
# sleep(6)
# spinner.stop("  WISH WE HAD A REALLY COOL MUSIC... ;-D".yellow.bold)

binding.pry

#cli.game
