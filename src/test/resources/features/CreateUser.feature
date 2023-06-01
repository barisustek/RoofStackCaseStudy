Feature: Create User operation test cases for given api.

  Scenario: TC_CreateUser_001_When /user endpoint is called with POST method and with valid values, it returns 200 and userId should return in response
    When POST /users endpoint is called with parameters
      | firstName | lastName | userName | password  |
      | Baris     | Ustek    | bustek   | Study123* |
    Then Http status code should be 200
    And Users should return
      | userId                               |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 |

  Scenario Outline: TC_CreateUser_002_When /user endpoint is called with <firstName> in request, it returns 400 and <errorMessage> in response
    When POST /users endpoint is called with parameters
      | firstName   | lastName | userName | password  |
      | <firstName> | Ustek    | bustek   | Study123* |
    Then Http status code should be 400 and returns <errorMessages> in responseBody

    Examples:
      | firstName                                          | errorMessages                                      |
      | <null>                                             | firstName cannot be null                           |
      |                                                    | firstName cannot be empty                          |
      | a                                                  | firstName must be between 2-50 characters.         |
      | abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcde | firstName must be between 2-50 characters.         |
      | 123                                                | firstName can only contain alpha characters. [A-Z] |
      | 123ab                                              | firstName can only contain alpha characters. [A-Z] |
      | ab@                                                | firstName can only contain alpha characters. [A-Z] |
      | ab@123                                             | firstName can only contain alpha characters. [A-Z] |


  Scenario Outline: TC_CreateUser_003_When /user endpoint is called with <lastName> in request, it returns 400 and <errorMessage> in response
    When POST /user endpoint is called with parameters
      | firstName | lastName   | userName | password  |
      | Baris     | <lastName> | bustek   | Study123* |
    Then Http status code should be 400 and returns <errorMessages> in responseBody

    Examples:
      | lastName                                           | errorMessages                                     |
      | <null>                                             | lastName cannot be null.                          |
      |                                                    | lastName cannot be empty.                         |
      | a                                                  | lastName must be between 2-50 characters.         |
      | abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcde | lastName must be between 2-50 characters.         |
      | 123                                                | lastName can only contain alpha characters. [A-Z] |
      | 123ab                                              | lastName can only contain alpha characters. [A-Z] |
      | ab@                                                | lastName can only contain alpha characters. [A-Z] |
      | ab@123                                             | lastName can only contain alpha characters. [A-Z] |

  Scenario Outline: TC_CreateUser_004_When /user endpoint is called with <username> in request, it returns 400 and <errorMessage> in response
    When POST /user endpoint is called with parameters
      | firstName | lastName | userName   | password  |
      | Baris     | Ustek    | <username> | Study123* |
    Then Http status code should be 400 and returns <errorMessages> in responseBody

    Examples:
      | username      | errorMessages                             |
      | <null>        | username cannot be null or empty.         |
      |               | username cannot be null or empty.         |
      | a             | username must be between 4-12 characters. |
      | ab            | username must be between 4-12 characters. |
      | abc           | username must be between 4-12 characters. |
      | abcdefghijklm | username must be between 4-12 characters. |
      | Study123*     | username and password cannot be same.     |

  Scenario Outline: TC_CreateUser_005_When /user endpoint is called with <password> in request, it returns 400 and <errorMessage> in response
    When POST /user endpoint is called with parameters
      | firstName | lastName | userName | password   |
      | Baris     | Ustek    | bustek   | <password> |
    Then Http status code should be 400 and returns <errorMessages> in responseBody

    Examples:
      | password      | errorMessages                             |
      | <null>        | username cannot be null or empty.         |
      |               | username cannot be null or empty.         |
      | a             | username must be between 4-12 characters. |
      | ab            | username must be between 4-12 characters. |
      | abc           | username must be between 4-12 characters. |
      | abcdefghijklm | username must be between 4-12 characters. |
      | bustek        | username and password cannot be same.     |
