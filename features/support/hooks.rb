Before do |scenario|
  EvidenceHandler.feature_scenario_path(scenario)
  EvidenceHandler.counter(perform: :set)
end

AfterConfiguration do
  Kernel.puts 'Setting paths...'
  EvidenceHandler.init_paths
  Kernel.puts "Running test for environment: '#{ENVIRON}'"
end

AfterStep do
  path = EvidenceHandler.counter
  embed(path, 'image/png', '--EVIDENCE--') unless path.nil?
  EvidenceHandler.path_to_nil
end

After do |scenario|
  if scenario.failed?
    ss_failure = EvidenceHandler.save(scenario)
    file = Base64.encode64(File.read(ss_failure))
    embed(file, 'image/png', '--EVIDENCE--')
  end
  Capybara.current_session.driver.quit
end
