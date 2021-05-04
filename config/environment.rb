# Load Gems

require 'bundler'
Bundler.require
Dotenv.load

# Load files
require_all "app"

# require_relative "../app/models/cli.rb"
# require_relative "../app/models/breaking_bad_api.rb"
# require_relative "../app/models/character.rb"
# require_relative "../app/models/message.rb"
# require_relative "../app/models/user.rb"
# require_relative "../db/seeds.rb"

# Set up database

ActiveRecord::Base.establish_connection({
  adapter: "sqlite3",
  database: "db/development.sqlite"
})
