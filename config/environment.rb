require 'bundler'
Bundler.require
require "tty-prompt"
require 'tty-table'
#require 'artii'


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil

require_all 'lib'
require_all 'bin'
