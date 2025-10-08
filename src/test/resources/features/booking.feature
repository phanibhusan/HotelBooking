@CreateBooking @regressiontests
Feature: Test booking creation functionality for a online booking application

@happypath
Scenario Outline: Successfully create a new room booking
Given user hits endpoint "api/booking"
    When user books the room with the given details
		| firstname   | lastname   | email   | phone   | checkin   | checkout   |	
        | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
    Then the response status code should be 200
    
    Examples:
      | firstname | lastname | email                | phone       | checkin    | checkout   |
      | virat     | kohli    | virat.kohli@gmail.com| 9876789098 | 2025-10-15 | 2025-10-19  |
      | MS        | Dhoni    | msd@gmail.com        | 8547589630 | 2025-10-20 | 2025-10- 20 |
      
      
      
@happypath_1
 Scenario Outline: Successfully create a single room booking
    Given user hits endpoint "api/booking"
    When user books the room with the given details
		| firstname   | lastname   | email   | phone   | checkin   | checkout   |	
        | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
    Then the response status code should be 200
    
    Examples:
      | firstname | lastname | email                | phone       | checkin    | checkout   |
      | virat     | kohli    | virat.kohli@gmail.com| 9876789098 | 2025-10-15 | 2025-10-19  |
      | MS        | Dhoni    | msd@gmail.com        | 8547589630 | 2025-10-20 | 2025-10- 20 | 
      
      
@happypath_2
 Scenario Outline: Successfully create a Double room booking
    Given user hits endpoint "api/booking"
    When user books the room with the given details
		| firstname   | lastname   | email   | phone   | checkin   | checkout   |	
        | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
    Then the response status code should be 200
    
    Examples:
      | firstname | lastname | email                | phone       | checkin    | checkout   |
      | virat     | kohli    | virat.kohli@gmail.com| 9876789098 | 2025-10-15 | 2025-10-19  |
      | MS        | Dhoni    | msd@gmail.com        | 8547589630 | 2025-10-20 | 2025-10- 20 |  
      
@happypath_3
 Scenario Outline: Successfully create a Suit room booking
    Given user hits endpoint "api/booking"
    When user books the room with the given details
		| firstname   | lastname   | email   | phone   | checkin   | checkout   |	
        | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
    Then the response status code should be 200
    
    Examples:
      | firstname | lastname | email                | phone       | checkin    | checkout   |
      | virat     | kohli    | virat.kohli@gmail.com| 9876789098 | 2025-10-15 | 2025-10-19  |
      | MS        | Dhoni    | msd@gmail.com        | 8547589630 | 2025-10-20 | 2025-10- 20 |
      
 
 
   
@negativepath_1

Scenario Outline: create a booking with incorrect field values
	Given user hits endpoint "api/booking"
    And user books the room with the given details
      | firstname   | lastname   | email   | phone   | checkin   | checkout   | bookingid   |
      | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> | <bookingid> |
    Then the response status code should be 400
	And the user should see valid error response "<FieldError>"

    Examples:
      | firstname | lastname | email               | phone        | checkin    | checkout    | FieldError                          |
      |           | raj      | raj@gmail.com       | 98774523656   | 2025-03-15 | 2025-03-18 | Firstname should not be blank       |
      | rahul     |          | rahul@gmail.com     | 98774523657   | 2025-03-15 | 2025-03-18 | Lastname should not be blank        |
      | ra        | kumar    | ram@gmail.com       | 98774523657   | 2025-03-15 | 2025-03-18 | size must be between 3 and 18       |
      | kumar     | rw       | kumar@gmail.com     | 87955879708   | 2025-03-15 | 2025-03-18 | size must be between 3 and 30       |
      | sanju     | sam      | sam.4gmail.com      | 87955879706   | 2025-03-15 | 2025-03-18 | must be a well-formed email address |
      | sonul     | sam      | sonu.rt@gmail.com   | 8795587970    | 2025-03-15 | 2025-03-18 | size must be between 11 and 21      |
      | sruti     | pal      | pal.46@gmail.com    |               | 2025-03-15 | 2025-03-18 | must not be empty                   |
      | sruti     | pal      |                     |  87955879706  | 2025-03-15 | 2025-03-18 | must not be empty                   |
      | sruti     | pal      | pal.46@gmail.com    |  87955879706  |            | 2025-03-18 | must not be empty                   |
      
    
@negativepath_2
Scenario Outline: create a booking with invalid date range
	Given user hits endpoint "api/booking"
    And user books the room with the given details
      | firstname   | lastname   | email   | phone   | checkin   | checkout   | bookingid   |
      | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> | <bookingid> |
    Then the response status code should be 400
	And the user should see valid error response "<FieldError>"

    Examples:
      | firstname | lastname | email               | phone        | checkin    | checkout    | FieldError         |
      |  sam      | raj      | raj@gmail.com       | 98774523656  | 2025-03-18 | 2025-03-10  | invalid date range |
        
      
      
      