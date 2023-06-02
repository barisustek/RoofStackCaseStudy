Feature: Update User operation test cases for given api.

  Scenario Outline: TC_UpdateUser_001_When /users/<userId> endpoint is called with PUT method and with valid values, it returns 200 and userId should return in response
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

  Scenario Outline: TC_UpdateUser_002_When /users/<userId> endpoint is called with <firstName> in request, it returns 400 and <errorMessages> in response
    When PUT /users/<userId> endpoint is called with parameters
      | firstName   | lastName |
      | <firstName> | Ustek    |
    Then Http status code should be 400 and returns <errorMessages> in responseBody

    Examples:
      | userId                               | firstName                                          | errorMessages                                      |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | [Null]                                             | firstName cannot be null                           |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | [EmptyString]                                      | firstName cannot be empty                          |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | a                                                  | firstName must be between 2-50 characters.         |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcde | firstName must be between 2-50 characters.         |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | 123                                                | firstName can only contain alpha characters. [A-Z] |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | 123ab                                              | firstName can only contain alpha characters. [A-Z] |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | ab@                                                | firstName can only contain alpha characters. [A-Z] |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | ab@123                                             | firstName can only contain alpha characters. [A-Z] |


  Scenario Outline: TC_UpdateUser_003_When /user/<userId> endpoint is called with <lastName> in request, it returns 400 and <errorMessage> in response
    When PUT /users/<userId> endpoint is called with parameters
      | firstName | lastName   |
      | Baris     | <lastName> |
    Then Http status code should be 400 and returns <errorMessages> in responseBody

    Examples:
      | userId                               | lastName                                           | errorMessages                                     |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | [Null]                                             | lastName cannot be null.                          |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | [EmptyString]                                      | lastName cannot be empty.                         |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | a                                                  | lastName must be between 2-50 characters.         |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcde | lastName must be between 2-50 characters.         |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | 123                                                | lastName can only contain alpha characters. [A-Z] |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | 123ab                                              | lastName can only contain alpha characters. [A-Z] |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | ab@                                                | lastName can only contain alpha characters. [A-Z] |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | ab@123                                             | lastName can only contain alpha characters. [A-Z] |

