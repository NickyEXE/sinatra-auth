require_relative "./config/environment.rb"
require "sinatra/activerecord/rake"

desc "Open the console"
task :console do
  Pry.start
end

desc "Run the app"
task :run do
  CLI.new
end
