# frozen_string_literal: true

# Class to manage data that is created on execution time
class ExecutionData
  @execution_data = {}
  class << self
    attr_reader :execution_data

    # This method saves data on execution time
    # @param [sym] name: - name for the variable to be saved
    # @param [string/int/sym/array] value: - value to be saved, avoid to save objects
    def save(name:, value:)
      @execution_data[name.to_sym] = value
    end

    # This method retrieves data saved previously
    # @param [sym] name: - name for the variable to be retrieved
    def retrieve(name:)
      return nil unless execution_data.include? name.to_sym

      execution_data[name.to_sym]
    end
  end
end
