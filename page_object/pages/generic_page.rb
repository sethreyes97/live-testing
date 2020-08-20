# frozen_string_literal: true

class GenericPage
  extend Capybara::DSL


  class << self
    include GenericElements

    def search
      find(FIELDS[:search]).send_keys('holis')
      find(BUTTONS[:search]).click
      ExecutionData.save(name: 'hola', value: 'value')
    end
  end
end