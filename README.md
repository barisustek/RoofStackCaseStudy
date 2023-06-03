## About The Project

This project is created for RoofStack case study. Test scenarios were prepared in BDD format using Cucumber.

### Prerequisites

Java version should be 17 or above to run the tests.

### Dependencies

The project has the following dependencies and versions:

    JUnit: 5.9.2
    JUnit Platform: 1.9.2
    RestAssured: 5.0.1
    Gson: 2.9.0
    JsonAssert: 1.5.1
    Cucumber: 7.11.2

### Test Run

For running project following code should be run in root directory :
   ```sh
   mvn test
   ```

### Test report

cluecumber library is used for creating test report. Tests continue if any error or fail occurs during test runs. After runs completed report created at "target/cucumber-report".

### CI/CD

Jenkins file is added for ci/cd operations. In Jenkins, Cucumber-Report plugin should be installed for reporting.

### Test Cases

Test cases are : 

"TC_CreateUser_001_When /user endpoint is called with POST method and with valid values, API returns 200 and userId should return in the response."
"TC_CreateUser_002_When /user endpoint is called with "[Null]" in firstname field, API returns 400 and "firstName cannot be null" in the response."
"TC_CreateUser_002_When /user endpoint is called with "[EmptyString]" in firstname field, API returns 400 and "firstName cannot be empty" in the response."
"TC_CreateUser_002_When /user endpoint is called with "a" in firstname field, API returns 400 and "firstName must be between 2-50 characters." in the response."
"TC_CreateUser_002_When /user endpoint is called with "abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcde" in firstname field, API returns 400 and "firstName must be between 2-50 characters." in the response."
"TC_CreateUser_002_When /user endpoint is called with "123" in firstname field, API returns 400 and "firstName can only contain alpha characters. [A-Z]" in the response."
"TC_CreateUser_002_When /user endpoint is called with "123ab" in firstname field, API returns 400 and "firstName can only contain alpha characters. [A-Z]" in the response."
"TC_CreateUser_002_When /user endpoint is called with "ab@" in firstname field, API returns 400 and "firstName can only contain alpha characters. [A-Z]" in the response."
"TC_CreateUser_002_When /user endpoint is called with "ab@123" in firstname field, API returns 400 and "firstName can only contain alpha characters. [A-Z]" in the response."
"TC_CreateUser_003_When /user endpoint is called with "[Null]" in lastname field, API returns 400 and "lastName cannot be null." in the response."
"TC_CreateUser_003_When /user endpoint is called with "[EmptyString]" in lastname field, API returns 400 and "lastName cannot be empty." in the response."
"TC_CreateUser_003_When /user endpoint is called with "a" in lastname field, API returns 400 and "lastName must be between 2-50 characters." in the response."
"TC_CreateUser_003_When /user endpoint is called with "abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcde" in lastname field, API returns 400 and "lastName must be between 2-50 characters." in the response."
"TC_CreateUser_003_When /user endpoint is called with "123" in lastname field, API returns 400 and "lastName can only contain alpha characters. [A-Z]" in the response."
"TC_CreateUser_003_When /user endpoint is called with "123ab" in lastname field, API returns 400 and "lastName can only contain alpha characters. [A-Z]" in the response."
"TC_CreateUser_003_When /user endpoint is called with "ab@" in lastname field, API returns 400 and "lastName can only contain alpha characters. [A-Z]" in the response."
"TC_CreateUser_003_When /user endpoint is called with "ab@123" in lastname field, API returns 400 and "lastName can only contain alpha characters. [A-Z]" in the response."
"TC_CreateUser_004_When /user endpoint is called with "[Null]" in username field, API returns 400 and "username cannot be null or empty." in the response."
"TC_CreateUser_004_When /user endpoint is called with "[EmptyString]" in username field, API returns 400 and "username cannot be null or empty." in the response."
"TC_CreateUser_004_When /user endpoint is called with "a" in username field, API returns 400 and "username must be between 4-12 characters." in the response."
"TC_CreateUser_004_When /user endpoint is called with "ab" in username field, API returns 400 and "username must be between 4-12 characters." in the response."
"TC_CreateUser_004_When /user endpoint is called with "abc" in username field, API returns 400 and "username must be between 4-12 characters." in the response."
"TC_CreateUser_004_When /user endpoint is called with "abcdefghijklm" in username field, API returns 400 and "username must be between 4-12 characters." in the response."
"TC_CreateUser_004_When /user endpoint is called with "Study123*" in username field, API returns 400 and "username and password cannot be same." in the response."
"TC_CreateUser_005_When /user endpoint is called with "[Null]" in password field, API returns 400 and "username cannot be null or empty." in the response."
"TC_CreateUser_005_When /user endpoint is called with "[EmptyString]" in password field, API returns 400 and "username cannot be null or empty." in the response."
"TC_CreateUser_005_When /user endpoint is called with "a" in password field, API returns 400 and "username must be between 4-12 characters." in the response."
"TC_CreateUser_005_When /user endpoint is called with "ab" in password field, API returns 400 and "username must be between 4-12 characters." in the response."
"TC_CreateUser_005_When /user endpoint is called with "abc" in password field, API returns 400 and "username must be between 4-12 characters." in the response."
"TC_CreateUser_005_When /user endpoint is called with "abcdefghijklm" in password field, API returns 400 and "username must be between 4-12 characters." in the response."
"TC_CreateUser_005_When /user endpoint is called with "bustek" in password field, API returns 400 and "username and password cannot be same." in the response."
"TC_GetUser_001_When /user endpoint is called with GET method, all users should return"
"TC_GetUser_002_When /user endpoint is called with GET method and "c4f6c088-f91b-494e-b7f0-a08f48df3180" as a parameter, data of the userId given in the path should be returned."
"TC_GetUser_003_When /user endpoint is called with GET method and not existed user as a parameter, API returns 404."
"TC_DeleteUser_001_When /user/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with DELETE method and existing userID, the given user should be deleted successfully."
"TC_DeleteUser_002_When /user/54bb6815-ec95-4fc6-8532-57e003bed34f endpoint is called with DELETE method with not existing userId, API returns 404."
"TC_DeleteUser_002_When /user/ endpoint is called with DELETE method with not existing userId, API returns 404."
"TC_DeleteUser_002_When /user/abc endpoint is called with DELETE method with not existing userId, API returns 404."
"TC_SwitchUser_001_When /user/activity endpoint is called with PATCH method with "True" in status field, the given user status should be changed to "True"."
"TC_SwitchUser_001_When /user/activity endpoint is called with PATCH method with "False" in status field, the given user status should be changed to "False"."
"TC_SwitchUser_002_When /user endpoint is called with PATCH method with invalid status, API returns 400 and "isActive cannot be null" in the response body."
"TC_UpdateUser_001_When /users/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with PUT method and with valid values, API returns 200 and userId should return in response"
"TC_UpdateUser_002_When /users/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with "[Null]" in firstname field, API returns 400 and "firstName cannot be null" in response."
"TC_UpdateUser_002_When /users/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with "[EmptyString]" in firstname field, API returns 400 and "firstName cannot be empty" in response."
"TC_UpdateUser_002_When /users/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with "a" in firstname field, API returns 400 and "firstName must be between 2-50 characters." in response."
"TC_UpdateUser_002_When /users/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with "abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcde" in firstname field, API returns 400 and "firstName must be between 2-50 characters." in response."
"TC_UpdateUser_002_When /users/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with "123" in firstname field, API returns 400 and "firstName can only contain alpha characters. [A-Z]" in response."
"TC_UpdateUser_002_When /users/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with "123ab" in firstname field, API returns 400 and "firstName can only contain alpha characters. [A-Z]" in response."
"TC_UpdateUser_002_When /users/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with "ab@" in firstname field, API returns 400 and "firstName can only contain alpha characters. [A-Z]" in response."
"TC_UpdateUser_002_When /users/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with "ab@123" in firstname field, API returns 400 and "firstName can only contain alpha characters. [A-Z]" in response."
"TC_UpdateUser_003_When /user/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with "[Null]" in lastname field, API returns 400 and "lastName cannot be null." in response."
"TC_UpdateUser_003_When /user/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with "[EmptyString]" in lastname field, API returns 400 and "lastName cannot be empty." in response."
"TC_UpdateUser_003_When /user/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with "a" in lastname field, API returns 400 and "lastName must be between 2-50 characters." in response."
"TC_UpdateUser_003_When /user/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with "abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcde" in lastname field, API returns 400 and "lastName must be between 2-50 characters." in response."
"TC_UpdateUser_003_When /user/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with "123" in lastname field, API returns 400 and "lastName can only contain alpha characters. [A-Z]" in response."
"TC_UpdateUser_003_When /user/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with "123ab" in lastname field, API returns 400 and "lastName can only contain alpha characters. [A-Z]" in response."
"TC_UpdateUser_003_When /user/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with "ab@" in lastname field, API returns 400 and "lastName can only contain alpha characters. [A-Z]" in response."
"TC_UpdateUser_003_When /user/c4f6c088-f91b-494e-b7f0-a08f48df3180 endpoint is called with "ab@123" in lastname field, API returns 400 and "lastName can only contain alpha characters. [A-Z]" in response."