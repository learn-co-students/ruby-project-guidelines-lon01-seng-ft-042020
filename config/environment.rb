require 'bundler'
Bundler.require
require "tty-prompt"
require 'pry'
BY = File.read('lib/by.txt')
WELCOME = File.read('lib/welcome.txt')


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil

require_all 'lib'
require_all 'bin'
