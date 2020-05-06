require_relative '../config/environment'
require 'pry'
prompt = TTY::Prompt.new
cli = CliApp.new
BY = File.read('lib/by.txt')
WELCOME = File.read('lib/welcome.txt')



binding.pry

#cli.game
