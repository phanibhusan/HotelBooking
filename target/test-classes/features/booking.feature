@CreateBooking @regressiontests
Feature: Test booking creation functionality for a online booking application

@happypath
Scenario Outline: Create a new room booking
Given user hits endpoint "api/booking"
    When user books the room with the given details
		| firstname   | lastname   | email   | phone   | checkin   | checkout   |	
        | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
    Then the response status code should be 200
    
    Examples:
      | firstname | lastname | email                | phone       | checkin    | checkout   |
      | virat     | kohli    | virat.kohli@gmail.com| 9876789098 | 2025-10-15 | 2025-10-19  |
      | MS        | Dhoni    | msd@gmail.com        | 8547589630 | 2025-10-20 | 2025-10-    |
      
      