@getbooking @regressiontests

Feature: retrieve booking details

Background:
	Given user hits endpoint "api/auth/login"
	When user creates a auth token with login authentication as "admin" and "password"
	Then user should get the response code 200 

@getroomdetails
Scenario: Get the details of the room by room id
	Given user hits endpoint "api/booking"
	When asks the details of the room by room id 560
	Then the response status code should be 200
	
@getbookingdetails
Scenario: Get the details of all bookings without filter
	Given user hits endpoint "api/booking"
	When asks the details of the all bookings
	Then the response status code should be 200
	
@getroomsummary
Scenario: Get the details of the room summary
	Given user hits endpoint "api/room"
	When user requests the room summary details
	Then the response status code should be 200
	
@getbookingsummary
Scenario: Get the details of the booking summary(no filter)
	Given user hits endpoint "api/room"
	When user requests the booking summary details
	Then the response status code should be 200
	
@getroomdetailsbysize
Scenario: Get the details of the room by size
	Given user hits endpoint "api/booking"
	When asks the details of the room by room size (Single)
	Then the response status code should be 200
	
@getroomdetailsbysize
Scenario: Get the details of the room by size
	Given user hits endpoint "api/booking"
	When asks the details of the room by room size (Double)
	Then the response status code should be 200
	
@getroomdetailsbysize
Scenario: Get the details of the room by size
	Given user hits endpoint "api/booking"
	When asks the details of the room by room size (Suit)
	Then the response status code should be 200	
	
@getroompolicies
Scenario: Get the room policies details
	Given user hits endpoint "api/room"
	When user requests the room policies details
	Then the response status code should be 200
	
@getroomfeatures
Scenario: Get the room features details
	Given user hits endpoint "api/room"
	When user requests the room features details
	Then the response status code should be 200
	
@getroomprice
Scenario: Get the room price details
	Given user hits endpoint "api/room"
	When user requests the room price details
	Then the response status code should be 200
	
@getroomavailability
Scenario: Get the details of the room availability
	Given user hits endpoint "api/room"
	When user requests the room availability details from "2025-10-15" to "2025-10-17" dates
	Then the response status code should be 200	
	
@gethotellocation
Scenario: Get the hotel location details
	Given user hits endpoint "api/room"
	When user requests the room location details
	Then the response status code should be 200
	
@gethotelcontactdetails
Scenario: Get the hotel contact details
	Given user hits endpoint "api/room"
	When user requests the hotel contact details
	Then the response status code should be 200
	
@gethotelreview/ratings
Scenario: Get the hotel review details
	Given user hits endpoint "api/room"
	When user requests the hotel review details
	Then the response status code should be 200	
	
@gethoteloffers/discounts
Scenario: Get the offer/discounts details
	Given user hits endpoint "api/room"
	When user requests the hotel offer details
	Then the response status code should be 200
	
@gethotelpaymentoptions
Scenario: Get the payment option details available
	Given user hits endpoint "api/room"
	When user requests the hotel payment options details
	Then the response status code should be 200
	
@gethotelcancellationcharges
Scenario: Get the booking cancellation charges
	Given user hits endpoint "api/room"
	When user requests the hotel booking cancellation charges
	Then the response status code should be 200
	
@performschemavalidation
Scenario: Get the details of the room by room id and perform schema validation
	Given user hits endpoint "api/booking"
	When asks the details of the room by room id 421
	Then the response status code should be 200
	Then validate the response with json schema "getbookingresponseschema.json"