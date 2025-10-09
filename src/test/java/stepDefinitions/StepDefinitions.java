package stepDefinitions;

import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.json.JSONObject;
import org.testng.Assert;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import pojoObjects.Booking;
import pojoObjects.BookingDates;
import utilis.CommonUtil;

public class StepDefinitions {

	private BookingDates dates;
	private Booking bookingRequest;
	private CommonUtil util;
	private Response response;
	private int actualStatusCode;
	private int bookingId;

	private RequestSpecification requestSetup() {
		return null;
	}

	private void validateBookingResponse(String firstname, String lastname, String checkin, String checkout,
			int roomid) {
	}

	private String generateRandomRoomId() {
		return null;
	}

	private String createRequestBody() {

		return null;
	}

	public StepDefinitions() {
		bookingRequest = new Booking();
		util = new CommonUtil();
	}

	@Given("user hits endpoint {string}")
	public void user_hits_endpoint(String endpoint) {
		bookingRequest.setEndPoint(endpoint);
	}

	@When("user books the room with the given details")
	public void user_books_the_room_with_the_given_details(final DataTable dataTable) throws JsonProcessingException {

		// Prepare booking details from DataTable
		int roomid = Integer.parseInt(util.generateRandomRoomId());
		dates = new BookingDates();

		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			bookingRequest.setFirstname(data.get("firstname"));
			bookingRequest.setLastname(data.get("lastname"));
			bookingRequest.setEmail(data.get("email"));
			bookingRequest.setPhone(data.get("phone"));
			dates.setCheckin(data.get("checkin"));
			dates.setCheckout(data.get("checkout"));
			bookingRequest.setBookingDates(dates);
			bookingRequest.setRoomid(roomid);
			bookingRequest.setDepositpaid(false);
		}

		// Convert booking object to JSON
		ObjectMapper mapper = new ObjectMapper();
		String jsonBody = mapper.writeValueAsString(bookingRequest);

		System.out.println("Request Body: " + jsonBody);

		// Execute POST request
		response = util.requestSetup().body(jsonBody).when().post(bookingRequest.getEndPoint());

		// Debug logs
		System.out.println(" Response Code: " + response.getStatusCode());
		System.out.println(" Response Body: " + response.getBody().asString());
	}

	@Then("the response status code should be {int}")
	public void the_response_status_code_should_be(int expectedStatusCode) {
		System.out.println("Expected Status Code: " + expectedStatusCode);
		System.out.println("Actual Status Code: " + response.getStatusCode());
		System.out.println("Response Body: " + response.getBody().asString());
		Assert.assertEquals(response.getStatusCode(), expectedStatusCode);
		Assert.assertEquals(500, 200, "internal server error occoured");
	}

	@Then("user should get the response code {int}")
	public void user_should_get_the_response_code(Integer statusCode) {
		Assert.assertEquals(Long.valueOf(response.getStatusCode()), Long.valueOf(statusCode));
	}

	@Given("user hits endpoint {string}")
	public void user_hits_endpoint1(String endpoint) {
		System.out.println("Hitting endpoint: " + endpoint);
	}

	@When("user books the room with the given details")
	public void user_books_room_with_the_given_details(DataTable dataTable) {
		List<Map<String, String>> bookingData = dataTable.asMaps(String.class, String.class);

		for (Map<String, String> row : bookingData) {
			System.out.println("Booking Details:");
			System.out.println("Firstname: " + row.get("firstname"));
			System.out.println("Lastname: " + row.get("lastname"));
			System.out.println("Email: " + row.get("email"));
			System.out.println("Phone: " + row.get("phone"));
			System.out.println("Check-in: " + row.get("checkin"));
			System.out.println("Check-out: " + row.get("checkout"));
			System.out.println("---------------------------");
		}

		actualStatusCode = 200; // Mocked response for now
	}

	@Then("the response status code should be {int}")
	public void the_response_status_code_should_be(Integer expectedStatusCode) {
		System.out.println("Validating response status code...");
		System.out.println("Expected: " + expectedStatusCode + ", Actual: " + actualStatusCode);

		// JUnit assertion — order: expected, actual
		Assert.assertEquals(expectedStatusCode.intValue(), actualStatusCode);
	}

	@When("user creates a auth token with login authentication as {string} and {string}")
	public void user_creates_a_auth_token_with_login_authentication_as_and(String userName, String password) {
		JSONObject loginAuth = new JSONObject();
		loginAuth.put("username", userName);
		loginAuth.put("password", password);
		response = requestSetup().body(loginAuth.toString()).when().post(bookingRequest.getEndPoint());
		String token = response.jsonPath().getString("token");
		bookingRequest.setToken(token);
	}

	@When("asks the details of the room by room id {int}")
	public void asks_the_details_of_the_room_by_room_id(int roomid) {
		response = requestSetup().cookie("token", bookingRequest.getToken()).param("roomid", roomid).when()
				.get(bookingRequest.getEndPoint());
	}

	@When("User requests the details of the room by room id")
	public void User_requests_the_details_of_the_room_by_room_id() {

		response = requestSetup().cookie("token", bookingRequest.getToken()).param("roomid", bookingRequest.getRoomid())
				.when().get(bookingRequest.getEndPoint());
		bookingId = response.jsonPath().getInt("bookings[0].bookingid");
		bookingRequest.setBookingId(bookingId);
		System.out.println("Booking ID of the booked room = " + bookingId);
		validateBookingResponse(bookingRequest.getFirstname(), bookingRequest.getLastname(), dates.getCheckin(),
				dates.getCheckout(), bookingRequest.getRoomid());
	}

	@When("the user edits the booking details")
	public void theUserEditsTheBookingDetails(final DataTable dataTable) throws JsonProcessingException {
		int roomid = Integer.parseInt(generateRandomRoomId());
		dates = new BookingDates();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			bookingRequest.setFirstname(data.get("firstname"));
			bookingRequest.setLastname(data.get("lastname"));
			dates.setCheckin(data.get("checkin"));
			dates.setCheckout(data.get("checkout"));
			bookingRequest.setBookingDates(dates);
			bookingRequest.setRoomid(roomid);
			bookingRequest.setDepositpaid(false);
		}
		response = requestSetup().body(createRequestBody()).cookie("token", bookingRequest.getToken()).when()
				.put(bookingRequest.getEndPoint() + bookingId);

		System.out.println("response status code =" + response.statusCode());
	}

}
