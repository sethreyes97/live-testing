require 'capybara/dsl'
require 'yaml'
require 'cucumber'
require 'selenium-webdriver'
require 'factory_bot'
require 'faker'
require 'require_all'
require 'dotenv'

ENVIRON = ENV.fetch('ENVIRON','test')
BROWSER = ENV.fetch('BROWSER','chrome')

require_all './handlers'
require_all './page_object'
require_all './utils'
require_all './config'
require_all './data'