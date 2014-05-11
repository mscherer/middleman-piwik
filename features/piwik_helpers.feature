Feature: Piwik helpers for js and img.

  Scenario: Helpers works
    Given a fixture app "test-app"
    And a file named "config.rb" with:
      """
      activate :piwik do |f|
        f.id = 3
        f.domain = 'piwik.example.com'
      end
      """
    Given the Server is running at "test-app"
    When I go to "/piwik_both.html"
    Then I should see 'piwik.example.com/piwik.php?idsite=3'

