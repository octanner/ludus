require './config/environments/dotenv.rb'
require 'sauce_whisk'
require 'capybara/rspec'
require 'capybara'
require 'rspec'
require 'json'
require 'eyes_selenium'
require 'rspec/expectations'
require 'require_all'
require 'net/https'
require 'colorize'
require 'rspec/retry'
require 'oauth2'
require 'selenium-webdriver'
require 'pry'
require 'pry-byebug'
require 'faker'
require_all 'spec/*/helpers/**/*.rb'

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }

usesauce = ENV.fetch('USESAUCE', false)

Capybara.configure do |config|
  config.run_server = true
  config.default_max_wait_time = 15
  config.match = :prefer_exact
  config.ignore_hidden_elements = true
  config.visible_text_only = true
  config.automatic_reload = true
  config.default_driver = :selenium
end

RSpec.configure do |config|
  config.before do
    puts 'Using Selenium'
    browser = ENV.fetch('BROWSER', :chrome).downcase.to_sym
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: browser)
    end
    @driver = Capybara.current_session.driver
  end

  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers
  config.formatter = :documentation
  config.verbose_retry = true
  config.display_try_failure_messages = true
  config.default_retry_count = 2
  config.default_sleep_interval = 2
  config.filter_run_excluding broken: true
  config.filter_run_excluding sauce: false if usesauce
  ignore_app = Hash[ENV.fetch('APP_ENV', 'qa').downcase.to_sym, false]
  config.filter_run_excluding ignore_app
  config.expect_with :rspec do |c|
    c.syntax = %i[should expect]
  end
  config.example_status_persistence_file_path = 'tmp/rspec/example_status_persistence_file_path.txt'

  config.after do |scenario|
    # Save screenshot on failure
    if scenario.exception
      screenshot_directory = 'tmp/screenshots'
      FileUtils.mkdir_p(screenshot_directory)
      filename = Time.now.strftime('%m-%d_%H:%M:%S') + scenario.id.gsub(/\W/, '_')
      page.save_screenshot("#{screenshot_directory}/#{filename}.png")
    end
    @driver.quit
  end
end
