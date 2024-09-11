Feature: Invalid Inputs for Robotic Hoover API Test
  The API should gracefully handle invalid or missing input data.

  Scenario: Missing room dimensions
    Given the room size is missing
    And the hoover starts at 1, 1
    And the patches of dirt are:
      | 1 | 1 |
    When the driving instructions are "N"
    Then the request should return an error message "Bad Request" "Failed to read HTTP message" 400

  Scenario: Invalid room dimensions
    Given the room size is -5 by 5
    And the hoover starts at 1, 1
    And the patches of dirt are:
      | 1 | 1 |
    When the driving instructions are "N"
    Then the request should return an error message "Bad Request" "Failed to read HTTP message" 400

  Scenario: Missing hoover starting coordinates
    Given the room size is 5 by 5
    And the hoover starts at missing
    And the patches of dirt are:
      | 1 | 1 |
    When the driving instructions are "N"
    Then the request should return an error message "Bad Request" "Failed to read HTTP message" 400

  Scenario: Hoover starting coordinates outside the room
    Given the room size is 5 by 5
    And the hoover starts at 6, 6
    And the patches of dirt are:
      | 1 | 1 |
    When the driving instructions are "N"
    Then the request should return an error message "Bad Request" "Failed to read HTTP message" 400

  Scenario: Missing dirt patches
    Given the room size is 5 by 5
    And the hoover starts at 1, 1
    And the patches of dirt are missing
    When the driving instructions are "N"
    Then the final hoover position should be 1, 2
    And the number of cleaned patches should be 0

  Scenario: Invalid patches coordinates (negative numbers)
    Given the room size is 5 by 5
    And the hoover starts at 1, 1
    And the patches of dirt are:
      | -1 | 0 |
    When the driving instructions are "N"
    Then the request should return an error message "Bad Request" "Failed to read HTTP message" 400

  Scenario: Missing driving instructions
    Given the room size is 5 by 5
    And the hoover starts at 1, 1
    And the patches of dirt are:
      | 1 | 1 |
    When the driving instructions are missing
    Then the request should return an error message "Bad Request" "Failed to read HTTP message" 400
  
  Scenario: Invalid driving instructions (non-cardinal directions)
    Given the room size is 5 by 5
    And the hoover starts at 1, 1
    And the patches of dirt are:
      | 1 | 1 |
    When the driving instructions are "NXYS"
    Then the request should return an error message "Bad Request" "Failed to read HTTP message" 400

  Scenario: Invalid patches of dirt (out of range of dimensions)
    Given the room size is 5 by 5
    And the hoover starts at 1, 1
    And the patches of dirt are:
      | 6 | 1 | 
      | 2 | 7 |  
      | 1 | 1 |
    When the driving instructions are "NNE"
    Then the request should return an error message "Bad Request" "Failed to read HTTP message" 400

  Scenario: Invalid patches of dirt (non numerical value)
    Given the room size is 5 by 5
    And the hoover starts at 1, 1
    And the patches of dirt are:
      | 6 | 1 | 
      | 2 | invalid | 
      | 1 | 1 |
    When the driving instructions are "NNE"
    Then the request should return an error message "Bad Request" "Failed to read HTTP message" 400
