require './config/environments/dotenv'

require 'oct_gaia'
require 'oct_gaia/aws_config'
require 'oct_gaia/mailinator_config'
require 'oct_gaia/rspec_config'
require 'oct_gaia/rspec_junit_formatter_config'
require 'oct_gaia/spec_helper_config'

require 'modules/utilities'
require_all 'spec/modules'

require 'capybara'
require 'colorize'
require 'pry-byebug'
require 'faker'
require 'faraday'
require_all 'spec/apps/*/helpers/**/*.rb'

# OctGaia.circleci_config
OctGaia.dockerfile
OctGaia.dotenv
OctGaia.rspec
OctGaia.oct_rubocop
OctGaia.ruby_version
