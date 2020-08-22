# frozen_string_literal: true

class BitsoCreateAccountPage
  extend Capybara::DSL


  class << self
    include BitsoCreateAccountElements

    def change_residence_country(country)
       find(:xpath, DROPDOWNS[:residence_country]).click
       find(FIELDS[:residence_country]).send_keys(country)
    end

    def enter_email(email)
      find(FIELDS[:email]).send_keys(email)
    end

    def enter_password(password)
      find(FIELDS[:password]).send_keys(password)
    end

    def accept_terms
      find(CHECKBOXES[:accept_terms]).click
    end

    def accept_news
      find(:xpath, CHECKBOXES[:accept_news]).click
    end

    def accept_privacy_policy
      find(CHECKBOXES[:accept_privacy_policy]).click
    end

    def validate_email_error_message
      find(:xpath, MESSAGES[:email_error_message])
      true
    end

    def validate_password_error_message
      find(:xpath, MESSAGES[:password_error_message])
      true
    end

  end
end