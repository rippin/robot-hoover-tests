Feature: Robotic Hoover API Test
  The API should correctly navigate the hoover based on room dimensions, dirt patches, and driving instructions.

  Scenario: Hoover cleans patches of dirt and moves correctly (rectangle)
    Given the room size is 7 by 8
    And the hoover starts at 1, 2
    And the patches of dirt are:
      | 1 | 0 |
      | 2 | 2 |
      | 2 | 3 |
    When the driving instructions are "NNESEESWNWW"
    Then the final hoover position should be 1, 3
    And the number of cleaned patches should be 3

  Scenario: Hoover moves without cleaning any dirt patches
    Given the room size is 5 by 5
    And the hoover starts at 0, 0
    And the patches of dirt are:
      | 4 | 4 |
      | 3 | 3 |
    When the driving instructions are "NNE"
    Then the final hoover position should be 1, 2
    And the number of cleaned patches should be 0

  Scenario: Hoover cleans multiple dirt patches
    Given the room size is 5 by 5
    And the hoover starts at 0, 0
    And the patches of dirt are:
      | 1 | 0 |
      | 1 | 2 |
      | 3 | 3 |
    When the driving instructions are "ENNNE"
    Then the final hoover position should be 2, 3
    And the number of cleaned patches should be 2

  Scenario: Hoover hits the wall but still cleans patches
    Given the room size is 5 by 5
    And the hoover starts at 1, 1
    And the patches of dirt are:
      | 0 | 0 |
      | 1 | 1 |
    When the driving instructions are "WWNNN"
    Then the final hoover position should be 0, 4
    And the number of cleaned patches should be 1

  Scenario: Hoover cleans all patches and remains inside the room
    Given the room size is 5 by 5
    And the hoover starts at 2, 2
    And the patches of dirt are:
      | 2 | 2 |
      | 3 | 3 |
      | 1 | 1 |
    When the driving instructions are "NESW"
    Then the final hoover position should be 2, 2
    And the number of cleaned patches should be 2

  Scenario: Hoover starts on a dirt patch
    Given the room size is 5 by 5
    And the hoover starts at 2, 2
    And the patches of dirt are:
      | 2 | 2 |
      | 3 | 3 |
    When the driving instructions are "NNE"
    Then the final hoover position should be 3, 4
    And the number of cleaned patches should be 1

  Scenario: Hoover attempts to clean the same dirt patch multiple times
    Given the room size is 7 by 7
    And the hoover starts at 1, 1
    And the patches of dirt are:
      | 1 | 1 |
      | 2 | 2 |
    When the driving instructions are "EENNNWWS"
    Then the final hoover position should be 1, 3
    And the number of cleaned patches should be 1
