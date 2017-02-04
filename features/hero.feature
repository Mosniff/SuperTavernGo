Feature: Hero
  As a newly created user, I should be able to create a hero
  As a logged in user, I should be able to view and alter my hero
  As a premium user, I should be able to create a second hero

  Background:

  @poltergeist

  Scenario: A new user creates their hero
    Given I am logged in as "cucumber@test.com"
    When I visit the home page
    Then I should be redirected to the create your hero page....
    When I fill in "..." with "..."
      And I fill in "..." with "..."
      And I fill in "..." with "..."
      And I fill in "..." with "..."
      And I fill in "..." with "..."
      And I click the "..." button
    Then I should be redirected to the map page...
      And a hero named "..." should exist in the database

  Scenario: A logged in user spends prestige to improve their hero
    Given I am logged in as "cucumber@test.com"
      And I have an experienced hero
      And I visit the home page
    When I click on the "..." nav item
    Then I should be redirected to the my hero page...
      # And javascript functionality to add and take away points and have all the bits instantly increment etc
      # 

