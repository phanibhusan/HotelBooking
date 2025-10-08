@DeleteBooking @regressiontests
Feature: Delete Booking Details

Background:
	Given user hits endpoint "api/auth/login"
	When user creates a auth token with login authentication as "admin" and "password"
	Then user should get the response code 200
	
@happypath
Scenario Outline: Delete a booking
	Given user hits endpoint "api/booking"
    And user books the room with the given details
	  | firstname   | lastname   | email   | phone   | checkin   | checkout   |	
      | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
	Then the response status code should be 200
	When User requests the details of the room by room id
	Then the response status code should be 200
	Given user hits endpoint "api/booking/"
	When the user deletes the booking with booking ID
	Then the response status code should be 200
    And a subsequent GET request for that booking id should return "not found"/ 404
	Examples:
      | firstname  | lastname | email              | phone       | checkin    | checkout   |
      | virat      | raj      | raj.re@gmail.com   | 46645895464 | 2025-09-15 | 2025-09-17 |
      
@negativepath_1
Scenario: Attempt to delete a booking that does not exist
       Given user hits endpoint "api/booking" 
       When User try to delete requests for a non-existent booking id
       Then The response status code should be 405
       And The response message should contain "Method not allowed"  
       
@negativepath_2
Scenario: Attempt to delete a booking with invalid booking ID
       Given user hits endpoint "api/booking" 
       When User try to delete requests for a invalid booking id
       Then The response status code should be 400
       
@negativepath_3
Scenario: Attempt to delete a booking ID which is already deleted
       Given user hits endpoint "api/booking" 
       When User try to delete requests for booking ID which is already deleted
       Then The response status code should be 404  
       
@negativepath_4
Scenario: Attempt to delete a booking without authentication
       Given user hits endpoint "api/booking" 
       When User try to delete requests without authentication
       Then The response status code should be 403
       And The response message should contain "Forbidden"              