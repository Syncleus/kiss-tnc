Feature: My bootstrapped app kinda works
  In order to get going on coding my awesome app
  I want to have aruba and cucumber setup
  So I don't have to do it myself

  Scenario: App just runs
    When I get help for "apex"
    Then the exit status should be 0
    And the banner should be present
    And the banner should document that this app takes options
    And the following options should be documented:
      |--version|
      |--[no]-switch|
      |--flag|
    And the banner should document that this app's arguments are:
      |needed|which is required|
      |maybe|which is optional|
    And there should be a one line summary of what the app does
