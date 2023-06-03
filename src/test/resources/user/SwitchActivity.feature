Feature: Test cases for activity switching operation of /users/<userId> endpoint.
* Http Method : PATCH

  Scenario Outline: TC_SwitchUser_001_When /user/activity endpoint is called with PATCH method with <status>, the given user status should be changed to <status>.
    When PATCH /user/<userId>/activity endpoint is called with parameters
      | isActive |
      | <status> |
    Then Http status code should be 200
    And UserId should return
      | userId                               | isActive |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | <status> |

    Examples:
      | userId                               | status |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | True   |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | False  |


  Scenario Outline: TC_SwitchUser_002_When /user endpoint is called with PATCH method with invalid status, API should return 400 and <errorMessages> in the response body.
    When PATCH /user/<userId>/activity endpoint is called with parameters
      | isActive |
      | <status> |
    Then Http status code should be 400 and returns <errorMessages> in responseBody

    Examples:
      | userId                               | status | errorMessages           |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 |        | isActive cannot be null |