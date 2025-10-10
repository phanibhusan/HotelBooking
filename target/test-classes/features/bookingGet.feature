@GetBooking @regression tests

Feature: retrieve booking details

Background:
	Given user hits endpoint "api/auth/login"
	When user creates a auth token with login authentication as "admin" and "password"
	Then user should get the response code 200 

@Getroomdetails
Scenario: Get the details of the room by room id
	Given user hits endpoint "api/booking"
	When asks the details of the room by room id 560
	Then the response status code should be 200
	
@Getbookingdetails @GetBooking
Scenario: Get the details of all bookings without filter
	Given user hits endpoint "api/booking"
	When asks the details of the all bookings
	Then the response status code should be 200
	
@Getroomsummary @GetBooking
Scenario: Get the details of the room summary
	Given user hits endpoint "api/room"
	When user requests the room summary details
	Then the response status code should be 200
	
@Getbookingsummary @GetBooking
Scenario: Get the details of the booking summary(no filter)
	Given user hits endpoint "api/room"
	When user requests the booking summary details
	Then the response status code should be 200
	
@Getroomdetailsbysize @GetBooking
Scenario: Get the details of the room by size
	Given user hits endpoint "api/booking"
	When asks the details of the room by room size (Single)
	Then the response status code should be 200
	
@Getroomdetailsbysize @GetBooking
Scenario: Get the details of the room by size
	Given user hits endpoint "api/booking"
	When asks the details of the room by room size (Double)
	Then the response status code should be 200
	
@Getroomdetailsbysize @GetBooking
Scenario: Get the details of the room by size
	Given user hits endpoint "api/booking"
	When asks the details of the room by room size (Suit)
	Then the response status code should be 200	
	
@Getroompolicies @GetBooking
Scenario: Get the room policies details
	Given user hits endpoint "api/room"
	When user requests the room policies details
	Then the response status code should be 200
	
@Getroomfeatures @GetBooking
Scenario: Get the room features details
	Given user hits endpoint "api/room"
	When user requests the room features details
	Then the response status code should be 200
	
@Getroomprice @GetBooking
Scenario: Get the room price details
	Given user hits endpoint "api/room"
	When user requests the room price details
	Then the response status code should be 200
	
@Getroomavailability @GetBooking
Scenario: Get the details of the room availability
	Given user hits endpoint "api/room"
	When user requests the room availability details from "2025-10-15" to "2025-10-17" dates
	Then the response status code should be 200	
	
@Gethotellocation @GetBooking
Scenario: Get the hotel location details
	Given user hits endpoint "api/room"
	When user requests the room location details
	Then the response status code should be 200
	
@Gethotelcontactdetails @GetBooking
Scenario: Get the hotel contact details
	Given user hits endpoint "api/room"
	When user requests the hotel contact details
	Then the response status code should be 200
	
@Gethotelreview/ratings @GetBooking
Scenario: Get the hotel review details
	Given user hits endpoint "api/room"
	When user requests the hotel review details
	Then the response status code should be 200	
	
@Gethoteloffers/discounts @GetBooking
Scenario: Get the offer/discounts details
	Given user hits endpoint "api/room"
	When user requests the hotel offer details
	Then the response status code should be 200
	
@Gethotelpaymentoptions @GetBooking
Scenario: Get the payment option details available
	Given user hits endpoint "api/room"
	When user requests the hotel payment options details
	Then the response status code should be 200
	
@Gethotelcancellationcharges @GetBooking
Scenario: Get the booking cancellation charges
	Given user hits endpoint "api/room"
	When user requests the hotel booking cancellation charges
	Then the response status code should be 200
	
@Performschemavalidation @GetBooking
Scenario: Get the details of the room by room id and perform schema validation
	Given user hits endpoint "api/booking"
	When asks the details of the room by room id 421
	Then the response status code should be 200
	Then validate the response with json schema "getbookingresponseschema.json"
	
@nvalidId @NegativePath
Scenario: validate the response code for invalid room ID
    Given user hits endpoint "api/auth/login"
    When asks the details of the room by room id 000
    Then user should get the response code 404

@invalidUsername @NegativePath
Scenario: validate the response code for invalid password
    Given user hits endpoint "api/auth/login"
    When user creates a auth token with login authentication as "admin13" and "password"
    Then user should get the response code 401 
      
@invalidPassword @NegativePath
Scenario: validate the response code for invalid password
    Given user hits endpoint "api/auth/login"
    When user creates a auth token with login authentication as "admin" and "password01"
    Then user should get the response code 401   
    
@MissingroomID @NegativePath
Scenario: validate the response code for missing room ID
    Given user hits endpoint "api/auth/login"
    When asks the details of the room without any room id
    Then user should get the response code 400
    
@nullRoomID @NegativePath
Scenario: validate the response for null room ID
    Given user hits endpoint "api/auth/login"
    When asks the details of the room by room id as null
    Then user should get the response code 400   

@withoutAuthentication @NegativePath
Scenario: Get booking details by id without authentication.
    Given user hits endpoint "api/auth/login"
    When user remove authentication token
    Then user should get the response code 403            	
	