@DeleteBooking @regression tests
Feature: Delete Booking Details

Background:
	Given user hits endpoint "api/auth/login"
	When user creates a auth token with login authentication as "admin" and "password"
	Then user should get the response code 200
	
@Happypath
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
    
    
@Happypath @DeleteBookingAfterEdit
Scenario Outline: Delete a booking after Edit
Given user hits endpoint "api/booking"
    And user books the room with the given details
		| firstname   | lastname   | email   | phone   | checkin   | checkout   |	
        | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
	Then user should get the response code 200
	And Save the booking ID for later use
    Given user hits endpoint "api/booking"
	When User requests the details of the room by bookingid
	Then the response status code should be 200 & booking displayed successfully
	Given user hits endpoint "api/booking/"
	When the user updates the booking details
      | firstname  | lastname | email              | phone         | checkin    | checkout   |
      | rahul      | kl   	  | rahul@gmail.com    | 46546321354   | 2025-10-19 | 2025-10-20 |
	Then the response status code should be 200
	And the response should contain updated booking details
	Given user hits endpoint "api/booking"
	When the user deletes the booking with booking ID
	Then the response status code should be 200 
	Given user hits endpoint "api/booking"
	When User request to get booking details by deleted booking ID
	Then The response status code should be 404
	And The response message should contain "Not found" message	    
	
	Examples:
     | firstname | lastname | email              | phone         | checkin    | checkout   |
     | virat     | ram      | ram@gmail.com      | 85421035698   | 2025-09-15 | 2025-09-17 |

       
@Negativepath @DeleteBookingThatDoesNotExist
Scenario: Attempt to delete a booking that does not exist
       Given user hits endpoint "api/booking" 
       When User try to delete requests for a non-existent booking id
       Then The response status code should be 405
       And The response message should contain "Method not allowed"  
       
@Negativepath @DeleteBookingWithInvalidBookingID
Scenario: Attempt to delete a booking with invalid booking ID
       Given user hits endpoint "api/booking" 
       When User try to delete requests for a invalid booking id
       Then The response status code should be 400
       
@Negativepath @DeleteBookingIDWhichIsAlreadyDeleted
Scenario: Attempt to delete a booking ID which is already deleted
       Given user hits endpoint "api/booking" 
       When User try to delete requests for booking ID which is already deleted
       Then The response status code should be 404  
       
@Negativepath @DeleteBookingWithoutAuthentication
Scenario: Attempt to delete a booking without authentication
       Given user hits endpoint "api/booking" 
       When User try to delete requests without authentication
       Then The response status code should be 403
       And The response message should contain "Forbidden"              