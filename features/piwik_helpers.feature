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
    Then I should see "piwik.example.com/piwik.php?idsite=3"
    Then I should see "setSiteId"
    Then I should see "noscript"

  Scenario: Helper for img work
    Given a fixture app "test-app"
    And a file named "config.rb" with:
      """
      activate :piwik do |f|
        f.id = 4
        f.domain = 'piwik_img.example.com'
      end
      """
    Given the Server is running at "test-app"
    When I go to "/piwik_img.html"
    Then I should see "piwik_img.example.com/piwik.php?idsite=4"
    Then I should not see "noscript"

  Scenario: Helper for js work
    Given a fixture app "test-app"
    And a file named "config.rb" with:
      """
      activate :piwik do |f|
        f.id = 5
        f.domain = 'piwik_js.example.com'
      end
      """
    Given the Server is running at "test-app"
    When I go to "/piwik_js.html"
    Then I should not see "noscript"
    Then I should see 'setSiteId'
