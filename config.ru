require_relative "config/environment.rb"

use Rack::MethodOverride
use UsersController
use MessagesController
use CharactersController
run ApplicationController
