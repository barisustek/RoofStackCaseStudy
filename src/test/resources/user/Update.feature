Feature: Test cases for updating operation of /users/<userId> endpoint.
* Http Method : PUT

  Scenario Outline: TC_UpdateUser_001_When /users/<userId> endpoint is called with PUT method and with valid values, API returns 200 and userId should return in response
    When PUT /users/<userId> endpoint is called with parameters
      | firstName | lastName |
      | Baris     | Ustek    |
    Then Http status code should be 200
    And UserId should return
      | userId   |
      | <userId> |

    Examples:
      | userId                               |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 |

  Scenario Outline: TC_UpdateUser_002_When /users/<userId> endpoint is called with "<firstName>" in firstname field, API returns 400 and "<errorMessage>" in response.
    When PUT /users/<userId> endpoint is called with parameters
      | firstName   | lastName |
      | <firstName> | Ustek    |
    Then Http status code should be 400 and returns <errorMessage> in responseBody

    Examples:
      | userId                               | firstName                                          | errorMessage                                       |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | [Null]                                             | firstName cannot be null                           |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | [EmptyString]                                      | firstName cannot be empty                          |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | a                                                  | firstName must be between 2-50 characters.         |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcde | firstName must be between 2-50 characters.         |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | 123                                                | firstName can only contain alpha characters. [A-Z] |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | 123ab                                              | firstName can only contain alpha characters. [A-Z] |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | ab@                                                | firstName can only contain alpha characters. [A-Z] |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | ab@123                                             | firstName can only contain alpha characters. [A-Z] |


  Scenario Outline: TC_UpdateUser_003_When /user/<userId> endpoint is called with "<lastName>" in lastname field, API returns 400 and "<errorMessage>" in response.
    When PUT /users/<userId> endpoint is called with parameters
      | firstName | lastName   |
      | Baris     | <lastName> |
    Then Http status code should be 400 and returns <errorMessage> in responseBody

    Examples:
      | userId                               | lastName                                           | errorMessage                                      |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | [Null]                                             | lastName cannot be null.                          |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | [EmptyString]                                      | lastName cannot be empty.                         |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | a                                                  | lastName must be between 2-50 characters.         |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcde | lastName must be between 2-50 characters.         |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | 123                                                | lastName can only contain alpha characters. [A-Z] |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | 123ab                                              | lastName can only contain alpha characters. [A-Z] |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | ab@                                                | lastName can only contain alpha characters. [A-Z] |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | ab@123                                             | lastName can only contain alpha characters. [A-Z] |