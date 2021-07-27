require 'dotenv'

# Setup build specific environment variables
ENV['APP_ENV'] = (ENV['APP_ENV'] || 'QA').upcase
ENV['ORIGIN'] ||= ('githubactions' if ENV['GITHUB_ACTIONS'])
ENV['BUILD_NUMBER'] ||= ENV['GITHUB_RUN_NUMBER'] || Time.now.to_i.to_s
ENV['DEVELOPER'] ||= ENV['GITHUB_ACTOR']
ENV['BRANCH'] ||= ENV['GITHUB_HEAD_REF']

# Load environment variables
Dotenv.load("./config/environments/#{ENV['APP_ENV'].downcase}.local",
            './config/environments/global.local',
            "./config/environments/#{ENV['APP_ENV'].downcase}",
            './config/environments/global',
            './config/environments/personal.local')
