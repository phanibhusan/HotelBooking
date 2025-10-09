package StepDefinations;
import java.util.Map;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.testng.Assert;
import org.testng.annotations.Test;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import pojoObjects.Booking;
import pojoObjects.BookingDates;
import utilis.CommonUtil;

public class stepdefination{

	BookingDates dates;
	String requestBody;
	int bookingId;
	Booking bookingRequest;
	CommonUtil util;
	Response response;
	
	public stepdefination() {}
	@Test
	@Given("user hits endpoint {string}")
	public void user_hits_endpoint(String endpoint) {
		bookingRequest.setEndPoint(endpoint);
	}	
	@When("user books the room with the given details")
	public void user_books_the_room_with_the_given_details(final DataTable dataTable) throws JsonProcessingException{
		
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

		        response = util.requestSetup()
				.body(util.createRequestBody())
				.when()
				.post("api/booking");
	}
	@Then("the response status code should be {int}")
	public void the_response_status_code_should_be(int expectedStatusCode) {
		
		Assert.assertEquals(expectedStatusCode, response.getStatusCode());		
	}
}
