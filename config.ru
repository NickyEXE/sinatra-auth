require_relative "config/environment.rb"

use Rack::MethodOverride
use CharactersController
run ApplicationController
