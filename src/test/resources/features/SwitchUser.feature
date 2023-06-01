Feature: Switch user operation test cases for given api.

  Scenario Outline: TC_SwitchUser_001_When /user endpoint is called with PATCH method with <status>, user status should be changed.
    When PATCH /user/<userId> endpoint is called with parameters
      | isActive |
      | <status> |
    Then Http status code should be 200
    And Users should return
      | userId                               | isActive |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | <status> |

    Examples:
      | userId                               | status |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | true   |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | false  |


  Scenario Outline: TC_SwitchUser_002_When /user endpoint is called with PATCH method with invalid status, api should returns 400 and <errorMessages> in response body.
    When PATCH /user/<userId> endpoint is called with parameters
      | isActive |
      | <status> |
    Then Http status code should be 400 and returns <errorMessages> in responseBody

    Examples:
      | userId                               | status |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | null   |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 |        |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | abcd   |