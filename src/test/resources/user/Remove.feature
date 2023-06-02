Feature: Test cases for remove operation of /users/<userId> endpoint

  Scenario Outline: TC_DeleteUser_001_When /user endpoint is called with DELETE method and existed userID, user should be deleted successfully.
    When DELETE /users/<userId> endpoint is called
    Then Http status code should be 200

    Examples:
      | userId                               |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 |

  Scenario Outline: TC_DeleteUser_002_When /user endpoint is called with DELETE method and <userId>, api returns 404
    When DELETE /users/<userId> endpoint is called
    Then Http status code should be 404

    Examples:
      | userId                               |
      | 54bb6815-ec95-4fc6-8532-57e003bed34f |
      | [EmptyString]                        |
      | abc                                  |
