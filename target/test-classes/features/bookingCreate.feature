@CreateBooking @regressiontests
Feature: Test booking creation functionality for a online booking application


@Happypath @NewRoomBooking
Scenario Outline: Successfully create a new room booking
    Given user hits endpoint "api/booking"
    When user books the room with the given details
		| firstname   | lastname   | email   | phone   | checkin   | checkout   |	
        | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
    Then the response status code should be 200
    
    Examples:
      | firstname | lastname | email                | phone       | checkin    | checkout   |
      | virat     | kohli    | virat.kohli@gmail.com| 98767890982 | 2025-10-15 | 2025-10-19 |
      | MSD       | Dhoni    | msd@gmail.com        | 85475896302 | 2025-10-20 | 2025-10-21 |
      
      
      
@Happypath @SingleRoomBooking
	 Scenario Outline: Successfully create a single room booking
	    Given user hits endpoint "api/booking"
	    When user books the room with the given details
			| firstname   | lastname   | email   | phone   | checkin   | checkout   |	
	        | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
	    Then the response status code should be 200
	    
	    Examples:
	      | firstname | lastname | email                | phone       | checkin    | checkout   |
	      | virat     | kohli    | virat.kohli@gmail.com| 98767890986 | 2025-10-15 | 2025-10-19 |
	      | MSD        | Dhoni    | msd@gmail.com       | 85475896306 | 2025-10-20 | 2025-10-21 | 
      
      
@Happypath @DoubleRoomBooking
 Scenario Outline: Successfully create a Double room booking
    Given user hits endpoint "api/booking"
    When user books the room with the given details
		| firstname   | lastname   | email   | phone   | checkin   | checkout   |	
        | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
    Then the response status code should be 200
    
    Examples:
      | firstname | lastname | email                | phone       | checkin    | checkout   |
      | virat     | kohli    | virat.kohli@gmail.com| 98767890989 | 2025-10-15 | 2025-10-19 |
      | MSD       | Dhoni    | msd@gmail.com        | 85475896309 | 2025-10-20 | 2025-10- 21|  
      
@Happypath @SuitRoomBooking
 Scenario Outline: Successfully create a Suit room booking
    Given user hits endpoint "api/booking"
    When user books the room with the given details
		| firstname   | lastname   | email   | phone   | checkin   | checkout   |	
        | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
    Then the response status code should be 200
    
    Examples:
      | firstname | lastname | email                | phone       | checkin    | checkout   |
      | virat     | kohli    | virat.kohli@gmail.com| 98767890988 | 2025-10-15 | 2025-10-19  |
      | MSDD      | Dhoni    | msd@gmail.com        | 85475896308 | 2025-10-20 | 2025-10- 20 |
      
 
 
   
@Negativepath @IncorrectFieldValues

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
      
    
@Negativepath @InvalidDateRange
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
        
      
@Negativepath @MoreThanTwoPerson
Scenario Outline: create a booking with more than two person
	Given user hits endpoint "api/booking"
    And user books the room with the given details
      | firstname   | lastname   | email   | phone   | checkin   | checkout   | bookingid   |
      | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> | <bookingid> |
    Then the response status code should be 400
	And the user should see valid error response "<FieldError>"

    Examples:
      | firstname | lastname | email                | phone        | checkin    | checkout    | FieldError                 |
      |  sam      | raj      | raj1@gmail.com       | 98774523656  | 2025-03-10 | 2025-03-18  | maximum two guests allowed | 
      |  ram      | raj      | raj2@gmail.com       | 98774523656  | 2025-03-12 | 2025-03-13  | maximum two guests allowed | 
      |  dam      | raj      | raj3@gmail.com       | 98774523656  | 2025-03-15 | 2025-03-16  | maximum two guests allowed |
    
@Negativepath @MissingMandatoryFields
Scenario Outline: create a booking with missing mandatory fields
	Given user hits endpoint "api/booking"
    And user books the room with the given details
       |lastname   | email   | phone   | checkin   | checkout   | bookingid   |
       |<lastname> | <email> | <phone> | <checkin> | <checkout> | <bookingid> |
    Then the response status code should be 400
	And the user should see valid error response "<FieldError>"

    Examples:
      | lastname | email                | phone        | checkin    | checkout    | FieldError                 |
      | raj      | raj1@gmail.com       | 98774523656  | 2025-03-10 | 2025-03-18  | Mandatory field is missing | 
      
      
@invalidFirstname @Negativepath
Scenario: create booking with firstname contains special character
	Given user hits endpoint "api/booking/"
    When user create booking request with "firstname" as "R@M#U"
    Then the response status code should be 400  
 
@invalidLastname @Negativepath
Scenario: create booking with lastname contains numeric value
	Given user hits endpoint "api/booking/"
    When user create booking request with "lastname" as "2345"
    Then the response status code should be 400
    
@invalidPhoneno	@Negativepath
Scenario: create booking with phoneno contains alphanumeric value
	Given user hits endpoint "api/booking/"
    When user create request with "phoneno" as "2345hjuyt7u"
    Then the response status code should be 400  
    