Feature: Test cases for getting user operation of /users/ endpoint.
  * Http Method : GET

  Scenario: TC_GetUser_001_When /user endpoint is called with GET method, all users should return
    When GET /users endpoint is called without parameters
    Then Http status code should be 200
    And Users List should return
      | id                                   | username      | firstName | lastName | isActive |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | doejj         | jane      | doe      | True     |
      | c3e140a4-99db-44c2-a9ea-896904745993 | johnthesavior | john      | doe      | False    |

  Scenario Outline: TC_GetUser_002_When /user endpoint is called with GET method and "<userId>" as a parameter, data of the userId given in the path should be returned.
    When GET /users/<userId> endpoint is called
    Then Http status code should be 200
    And Users should return
      | id                                   | username | firstName | lastName | isActive |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | doejj    | jane      | doe      | True     |

    Examples:
      | userId                               |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 |

  Scenario Outline: TC_GetUser_003_When /user endpoint is called with GET method and not existed user as a parameter, API returns 404.
    When GET /users/<userId> endpoint is called
    Then Http status code should be 404

    Examples:
      | userId                               |
      | a60d7406-b943-4010-9bb0-a594aae6b1c1 |