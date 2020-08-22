Feature: Testing

  Scenario: Test
    Given user visit the "bitso" page
    And user opens create account page
    And user changes residence country
    And user enters email
    And user enters password
    And user accepts terms and conditions
    And user accepts receiving news
    And user accepts privacy policy
    Then user should see error messages
