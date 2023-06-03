Feature: Test cases for removing operation of /users/<userId> endpoint.
  * Http Method : DELETE

  Scenario Outline: TC_DeleteUser_001_When /user/<userId> endpoint is called with DELETE method and existing userID, the given user should be deleted successfully.
    When DELETE /users/<userId> endpoint is called
    Then Http status code should be 200

    Examples:
      | userId                               |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 |

  Scenario Outline: TC_DeleteUser_002_When /user/<userId> endpoint is called with DELETE method with not existing userId, API returns 404.
    When DELETE /users/<userId> endpoint is called
    Then Http status code should be 404

    Examples:
      | userId                               |
      | 54bb6815-ec95-4fc6-8532-57e003bed34f |
      |                                      |
      | abc                                  |