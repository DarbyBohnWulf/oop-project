Feature: Intelligent Startup
  The app should behave differently based on command line options.

  Scenario: Plain Startup
    Given a file 'lib/app.rb' is loaded
    When I successfully execute `App.start`
    Then I should see a menu with:
    """
    """
