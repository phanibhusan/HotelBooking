Rest-Assured Cucumber BDD Framework
Key features in the framework:
Test automation framework using Rest-Assured for testing the hotel room booking API
Cucumber is used for BDD
Feature file has examples from which input is fed into a POJO class and the request is constructed dynamically using Jackson library
Common methods are placed in CommonUtilis class
Json schema validation is performed using JsonSchemaValidator
Get booking details with roomid response is validated against the schema : getbookingresponseschema.json
I have constructed the json schema based on the response received
Junit is used for test execution
Tests can be executed with Tags marked at feature level and scenario level based on the type of test scenarios
Version:
Java 21
Maven - To manage dependencies
IDE ( Eclipse)
Libraries and Tools Used:
Rest-Assured: For API Testing
Cucumber: For Behavior-Driven Development (BDD)
TestNg: To execute Cucumber tests
Jackson-Databind: For creating JSON content from Java Objects (POJOs)
Installation
Clone the repository: git clone https://github.com/phanibhusan/HotelBooking.git

How to Run the Tests
To execute the tests go to TestRunner.class(src/test/java/runner/TestRunner.java)
Update the tags = "@regression tests" and run using command mvn clean install
we can use different tags:@CreateBooking , @getbooking , @EditBooking, @DeleteBooking , @happypath,@e2e,@Negativepath
