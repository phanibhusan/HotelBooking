@e2e @regression tests
Feature: end to end flow hotel booking API Tests

Background:
	Given user hits endpoint "api/auth/login"
	When user creates a auth token with login authentication as "admin" and "password"
	Then user should get the response code 200
	
@HappyPath
Scenario Outline: Test end to end flow booking functionality    
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

@HappyPath
Scenario Outline: Test end to end flow booking functionality    
    Given user hits endpoint "api/booking"
    And user books the room with the given details
		| firstname   | lastname   | email   | phone   | checkin   | checkout   |	
        | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
	Then user should get the response code 200
	And Save the booking ID for later use
    Given user hits endpoint "api/booking"
	When User requests the details of the room by bookingid
	Then the response status code should be 200 & booking displayed successfully
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
     
@HappyPath
Scenario Outline: Test end to end flow booking functionality    
    Given user hits endpoint "api/booking"
    And user books the room with the given details
		| firstname   | lastname   | email   | phone   | checkin   | checkout   |	
        | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
	Then user should get the response code 200
	And Save the booking ID for later use
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