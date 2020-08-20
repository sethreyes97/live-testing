
require 'erb'
require 'yaml'

# Module for accessing configs
module Config
  CONFIG_PATH = './config/config.yaml'
  CONFIG_DEFAULT_PATH = './config/config.yaml.default'
  ENV_FILE =  "./config/#{ENVIRON}.env"
  GENERAL_FILE = "./config/general.env"
  ENV_REQUIRED = './config/environment.env.default'

  CONFIG_KEYS = %w[urls timeouts].freeze

  def self.load_environment
    Dotenv.load(ENV_FILE, GENERAL_FILE) if File.file?(ENV_FILE)
    default_file = File.read(ENV_REQUIRED)
    required_keys = []
    default_file.each_line do |line|
      next if line.include? '#'
      required_keys << line.delete("\n")
    end
    begin
      Dotenv.require_keys(required_keys.reject(&:empty?))
    rescue Dotenv::MissingKeys => error
      puts error.message
      raise "Please set properly env file for: '#{ENVIRON}' environment or export above vars"
    end
  end

  def self.load_config_file!
    file_to_load = File.exist?(CONFIG_PATH) ? CONFIG_PATH : CONFIG_DEFAULT_PATH
    @config = YAML.safe_load(ERB.new(File.read(file_to_load)).result, [Symbol])
  end

  class << self
    CONFIG_KEYS.each { |key| define_method(key) { @config[key] } }
  end

end
