require_relative "config/environment.rb"

use Rack::MethodOverride
use UsersController
use CharactersController
run ApplicationController
