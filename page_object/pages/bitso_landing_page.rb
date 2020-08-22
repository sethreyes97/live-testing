# frozen_string_literal: true

class BitsoLandingPage
  extend Capybara::DSL


  class << self
    include BitsoLandingPageElements

    def click_create_account_button
      find(:xpath, BUTTONS[:create_account]).click
    end
  end
end