Config.load_environment
Config.load_config_file!


case BROWSER.to_sym
when :mozilla
  Capybara.register_driver :mozilla do |app|
    Capybara::Selenium::Driver.new(app, browser: :firefox)
  end
when :chrome
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end
else
  raise "Browser: '#{BROWSER}' not available."
end

Capybara.default_driver = BROWSER.to_sym
Capybara.default_max_wait_time = 10
