Feature: Color wheel
  In order to start a glowing session
  as the person in charge
  I want multiple devices to "rotate" their colors

  Background:
    Given there are 3 devices present

  Scenario: Pairing
    When the devices are activated
    Then a session with 3 devices should be created
    And the devices should have a unique identifier
    And the devices should be in order
    And all devices should have a different color