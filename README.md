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

