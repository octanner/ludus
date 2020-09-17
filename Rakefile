Dir.glob('lib/tasks/*.rake').each { |r| load r }
# Setup required for Gunter test results reporting
require 'gunter_reporter'
@gunter_reporter = GunterReporter.new

def generate_command(parallel: true)
  if ENV['COMMAND']
    ENV['COMMAND']
  elsif ENV['APP_TAG']
    "bundle exec parallel_rspec --serialize-stdout -n 8 -- --tag #{ENV['APP_TAG']} -- spec"
  elsif ARGV.count > 1
    case parallel
    when false
      "bundle exec rspec #{ARGV.drop(1).join(' ')}"
    when true
      "bundle exec parallel_rspec --serialize-stdout -n 8 #{ARGV.drop(1).join(' ')}"
    end
  end
end

def execute_tests(command, environment_variables = {})
  environment_variables['TEAM_NAME'] = 'ludus'
  environment_variables['TASK_ID'] = Time.now.strftime('%s%6N')
  puts "Running '#{command}' with environment variables #{environment_variables}"
  exit_status = system(environment_variables, command)
  @gunter_reporter.submit_results(environment_variables)
  raise 'Tests Failed' unless exit_status
end

desc 'Run tests locally'
task :local_ludus do
  execute_tests(generate_command)
end

SAUCE_OPTIONS = [
  { platform: 'macos 10.12', browser: 'chrome',            version: '59' },
  { platform: 'macos 10.12', browser: 'chrome',            version: 'beta' },
  { platform: 'OS X 10.11',  browser: 'safari',            version: '9.0' },
  { platform: 'Windows 7',   browser: 'chrome',            version: '59' },
  { platform: 'Windows 8.1', browser: 'chrome',            version: '59' },
  { platform: 'Windows 8.1', browser: 'internet explorer', version: '11' },
  { platform: 'Windows 10',  browser: 'chrome',            version: '59' },
  { platform: 'Windows 10',  browser: 'firefox',           version: '54' },
  { platform: 'Windows 10',  browser: 'microsoftedge',     version: '15' }
].freeze

def sauce_labs_environment_variables(platform:, browser:, version:)
  { 'USESAUCE' => 'true',
    'platform' => platform,
    'browserName' => browser,
    'version' => version }
end

SAUCE_OPTIONS.each do |sauce_option|
  platform = sauce_option[:platform]
  browser = sauce_option[:browser]
  version = sauce_option[:version]
  desc "Run tests on Sauce Labs with env vars: platform=\"#{platform}\" " \
       "browserName=\"#{browser}\" version=\"#{version}\" USESAUCE=\"true\""
  task "#{platform}_#{browser}_#{version}_ludus".downcase.gsub(/\W/, '_').to_sym do
    environment_variables = sauce_labs_environment_variables(sauce_option)
    execute_tests(generate_command, environment_variables)
  end
end

TASK_LIST = [
  # :local_ludus,
  # :windows_7_chrome_59_ludus,
  :windows_8_1_internet_explorer_11_ludus
  # :windows_10_chrome_59_ludus,
  # :windows_10_microsoftedge_15_ludus
  # :windows_10_firefox_54_ludus,
  # :os_x_10_11_safari_9_0_ludus,
  # :macos_10_12_chrome_59_ludus,
  # :macos_10_12_chrome_beta_ludus
].freeze

desc 'Run tests on multiple platforms'
multitask test_ludus_web: TASK_LIST do
end
