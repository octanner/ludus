Dir.glob('lib/tasks/*.rake').each { |r| load r }

def run_ludus_web(platform = nil, browser = nil, version = nil, junit_dir = nil)
  task_id = [Time.now.strftime('%s%6N'), platform, browser, version].join('-').gsub(/\s+/, '_')
  environment_variables = { 'TEAM_NAME'   => 'ludus',
                            'platform'    => platform,
                            'browserName' => browser,
                            'version'     => version,
                            'JUNIT_DIR'   => junit_dir,
                            'USESAUCE'    => (platform ? 'true' : nil),
                            'TASK_ID'     => task_id }
  default_spec_files = 'spec/ludus/web/test'
  spec_files = (ARGV.count > 1 ? ARGV.drop(1).join(' ') : default_spec_files)
  exit_status = system(environment_variables, "rspec #{spec_files}")

  raise 'Tests Failed' unless exit_status
end

desc 'Run tests locally'
task :local_ludus do
  run_ludus_web
end
