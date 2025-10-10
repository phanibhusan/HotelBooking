@EditBooking @regression tests
Feature: Edit HotelBooking Details

Background:
	Given user hits endpoint "api/auth/login"
	When user creates a auth token with login authentication as "admin" and "password"
	Then user should get the response code 200
	
	
@Editfirstname @Happypath
	Scenario Outline: Edit the firstname details
	Given user hits endpoint "api/booking/"
    And user books the room with the given details
	  | firstname   | lastname   | email   | phone   | checkin   | checkout   |	
      | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
	Then user should get the response code 200
	When User requests the details of the room by room id
	Then the response status code should be 200
	When the user edits the booking details
      | firstname | lastname | email              | phone         | checkin    | checkout   |
      | virat     | kohli    | virat1@gmail.com   | 46546321354   | 2025-10-12 | 2025-10-13 |
	Then the response status code should be 200
	
	Examples:
      | firstname | lastname | email              | phone       | checkin    | checkout   |
      | viraat    | kohli    | virat1@gmail.com   | 46546321354 | 2025-10-12 | 2025-10-13 |
	

@Editlastname @Happypath	
	Scenario Outline: Edit the lastname details
	Given user hits endpoint "api/booking/"
    And user books the room with the given details
	  | firstname   | lastname   | email   | phone   | checkin   | checkout   |	
      | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
	Then user should get the response code 200
	When User requests the details of the room by room id
	Then the response status code should be 200
	When the user edits the booking details
      | firstname | lastname | email              | phone         | checkin    | checkout   |
      | virat     | kohli    | virat1@gmail.com   | 46546321354   | 2025-10-12 | 2025-10-13 |
	Then the response status code should be 200
	
	Examples:
      | firstname | lastname | email              | phone       | checkin    | checkout   |
      | virat     | sahu     | virat1@gmail.com   | 46546321354 | 2025-10-12 | 2025-10-13 |


@Editemail @Happypath	
	Scenario Outline: Edit the lastname details
	Given user hits endpoint "api/booking/"
    And user books the room with the given details
	  | firstname   | lastname   | email   | phone   | checkin   | checkout   |	
      | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
	Then user should get the response code 200
	When User requests the details of the room by room id
	Then the response status code should be 200
	When the user edits the booking details
      | firstname | lastname | email                    | phone         | checkin    | checkout   |
      | virat     | kohli    | virat.kohli1@gmail.com   | 46546321354   | 2025-10-12 | 2025-10-13 |
	Then the response status code should be 200
	
	Examples:
      | firstname | lastname | email              | phone       | checkin    | checkout   |
      | virat     | kohli    | virat1@gmail.com   | 46546321354 | 2025-10-12 | 2025-10-13 |



@Editphone @Happypath	
	Scenario Outline: Edit the phone no details
	Given user hits endpoint "api/booking/"
    And user books the room with the given details
	  | firstname   | lastname   | email   | phone   | checkin   | checkout   |	
      | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
	Then user should get the response code 200
	When User requests the details of the room by room id
	Then the response status code should be 200
	When the user edits the booking details
      | firstname | lastname | email                    | phone         | checkin    | checkout   |
      | virat     | kohli    | virat.kohli1@gmail.com   | 85458789652   | 2025-10-12 | 2025-10-13 |
	Then the response status code should be 200
	
	Examples:
      | firstname | lastname | email                    | phone       | checkin    | checkout   |
      | virat     | kohli    | virat.kohli1@gmail.com   | 46546321354 | 2025-10-12 | 2025-10-13 |



@Editcheckindates @Happypath	
	Scenario Outline: Edit the phone no details
	Given user hits endpoint "api/booking/"
    And user books the room with the given details
	  | firstname   | lastname   | email   | phone   | checkin   | checkout   |	
      | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
	Then user should get the response code 200
	When User requests the details of the room by room id
	Then the response status code should be 200
	When the user edits the booking details
      | firstname | lastname | email                    | phone         | checkin    | checkout   |
      | virat     | kohli    | virat.kohli1@gmail.com   | 85458789652   | 2025-10-11 | 2025-10-13 |
	Then the response status code should be 200
	
	Examples:
      | firstname | lastname | email                    | phone       | checkin      | checkout   |
      | virat     | kohli    | virat.kohli1@gmail.com   | 85458789652 | 2025-10-12   | 2025-10-13 |


@Editcheckoutdates @Happypath	
	Scenario Outline: Edit the phone no details
	Given user hits endpoint "api/booking/"
    And user books the room with the given details
	  | firstname   | lastname   | email   | phone   | checkin   | checkout   |	
      | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
	Then user should get the response code 200
	When User requests the details of the room by room id
	Then the response status code should be 200
	When the user edits the booking details
      | firstname | lastname | email                    | phone         | checkin    | checkout   |
      | virat     | kohli    | virat.kohli1@gmail.com   | 85458789652   | 2025-10-11 | 2025-10-12 |
	Then the response status code should be 200
	
	Examples:
      | firstname | lastname | email                    | phone         | checkin      | checkout   |
      | virat     | kohli    | virat.kohli1@gmail.com   | 85458789652   | 2025-10-11   | 2025-10-13 |

	
@all @Happypath
Scenario Outline: Edit the booking details
	Given user hits endpoint "api/booking/"
    And user books the room with the given details
	  | firstname   | lastname   | email   | phone   | checkin   | checkout   |	
      | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
	Then user should get the response code 200
	When User requests the details of the room by room id
	Then the response status code should be 200
	When the user edits the booking details
      | firstname | lastname | email                    | phone         | checkin    | checkout   |
      | virat     | kohli    | virat.kohli1@gmail.com   | 85458789652   | 2025-10-11 | 2025-10-13 |
	Then the response status code should be 200
	
	Examples:
      | firstname  | lastname  | email              | phone       | checkin    | checkout   |
      | rohit      | sharma    | rohit.s@gmail.com  | 76525895464 | 2025-09-15 | 2025-09-17 |
      
      
@errors @Negativepath
Scenario Outline: Edit the firstname details
	Given user hits endpoint "api/booking/"
    And user books the room with the given details
	  | firstname   | lastname   | email   | phone   | checkin   | checkout   |	
      | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
	Then user should get the response code 200
	When User requests the details of the room by room id
	Then the response status code should be 200
	When the user edits the booking details
      Examples:
      | firstname | lastname | email               | phone         | checkin    | checkout   | FieldError                          |
      |           | raj      | raj@gmail.com       | 98774523656   | 2025-03-15 | 2025-03-18 | Firstname should not be blank       |
      | rahul     |          | rahul@gmail.com     | 98774523657   | 2025-03-15 | 2025-03-18 | Lastname should not be blank        |
      | ra        | kumar    | ram@gmail.com       | 98774523657   | 2025-03-15 | 2025-03-18 | size must be between 3 and 18       |
      | kumar     | rw       | kumar@gmail.com     | 87955879708   | 2025-03-15 | 2025-03-18 | size must be between 3 and 30       |
      | sanju     | sam      | sam.4gmail.com      | 87955879706   | 2025-03-15 | 2025-03-18 | must be a well-formed email address |
      | sonul     | sam      | sonu.rt@gmail.com   | 8795587970    | 2025-03-15 | 2025-03-18 | size must be between 11 and 21      |
      | smrut     | pale     | pal.46@gmail.com    |               | 2025-03-15 | 2025-03-18 | must not be empty                   |
      | snuti     | palt     |                     |  87955879706  | 2025-03-15 | 2025-03-18 | must not be empty                   |
      | smnuti    | pal      | pal.46@gmail.com    |  87955879706  |            | 2025-03-18 | must not be empty                   |
      | sjuti     | pal      | pal.46@gmail.com    |  87955879706  |  2025-03-18|            | must not be empty                   |
	Then the response status code should be 400
	And the user should see response with incorrect "<FieldError>"

Examples:
      | firstname | lastname | email               | phone         | checkin    | checkout   | 
      | ram       | raju     | raj@gmail.com       | 98774523656   | 2025-03-15 | 2025-03-18 | 
      | rahul     |  fegu    | rahul@gmail.com     | 98774523657   | 2025-03-15 | 2025-03-18 | 
      | ramj      | kumar    | ram@gmail.com       | 98774523657   | 2025-03-15 | 2025-03-18 | 
      | kumar     | ranga    | kumar@gmail.com     | 87955879708   | 2025-03-15 | 2025-03-18 | 
      | sanju     | sam      | sam.4@gmail.com     | 87955879706   | 2025-03-15 | 2025-03-18 | 
      | sonul     | sam      | sonu.rt@gmail.com   | 87955879702   | 2025-03-15 | 2025-03-18 | 
      | smrut     | pale     | pal.46@gmail.com    | 87955879702   | 2025-03-15 | 2025-03-18 | 
      | snuti     | palt     | pal.44@gmail.com    |  87955879706  | 2025-03-15 | 2025-03-18 | 
      | smnuti    | pal      | pal.6@gmail.com     |  87955879706  | 2025-03-15 | 2025-03-18 | 
      | sjuti     | pal      | pal.06@gmail.com    |  87955879706  | 2025-03-15 | 2025-03-18 |
      
 
@errors @Negativepath
Scenario Outline: Update a booking with missing mandatory fields
	Given user hits endpoint "api/booking"
    And user books the room with the given details
     | firstname   |lastname   | email   | phone   | checkin   | checkout   | bookingid   |
     | <firstname> |<lastname> | <email> | <phone> | <checkin> | <checkout> | <bookingid> |
    Then user should get the response code 200
	When User requests the details of the room by room id
	Then the response status code should be 200
	When the user edits the booking details
		
    Examples:
      | lastname | email                | phone        | checkin    | checkout    | FieldError                 |
      | raj      | raj1@gmail.com       | 98774523656  | 2025-03-10 | 2025-03-18  | Mandatory field is missing | 
 
      Then the response status code should be 400
	  And the user should see response with incorrect "<FieldError>"
	  
	Examples:
      | firstname | lastname | email              | phone       | checkin    | checkout   |
      | virat     | kohli    | virat1@gmail.com   | 46546321354 | 2025-10-12 | 2025-10-13 |
      
	
@invalidID @Negativepath	
Scenario: update booking with invalid ID
	Given user hits endpoint "api/booking/"
    And user have valid booking payloads with update details
    When user send a update request with invalid ID
    Then the response status code should be 404 
	
@invalidFirstname @Negativepath	
Scenario: update booking with firstname contains special character
	Given user hits endpoint "api/booking/"
    And user have valid booking payloads with update details
    When user update request with "firstname" as "R@M#U"
    Then the response status code should be 400  
 
@invalidLastname @Negativepath	
Scenario: update booking with lastname contains numeric value
	Given user hits endpoint "api/booking/"
    And user have valid booking payloads with update details
    When user update request with "lastname" as "2345"
    Then the response status code should be 400
    
@invalidPhoneno	@Negativepath
Scenario: update booking with phoneno contains alphanumeric value
	Given user hits endpoint "api/booking/"
    And user have valid booking payloads with update details
    When user update request with "phoneno" as "2345hjuyt7u"
    Then the response status code should be 400  
    
@invalidDaterange @Negativepath
 Scenario: update booking with checkin/checkout date contains invalid date range
	Given user hits endpoint "api/booking/"
    And user have valid booking payloads with update details
    When user update request with "checkin date" is greater than "checkout date"
    Then the response status code should be 400     
      