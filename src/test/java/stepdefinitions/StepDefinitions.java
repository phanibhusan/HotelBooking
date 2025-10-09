package StepDefinations;

import static org.junit.Assert.assertEquals;

import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.testng.Assert;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import pojoObjects.Booking;
import pojoObjects.BookingDates;
import utilis.CommonUtil;

public class stepdefination {

    private BookingDates dates;
    private Booking bookingRequest;
    private CommonUtil util;
    private Response response;

    public stepdefination() {
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

        // Debug logs
        System.out.println("Request Body: " + jsonBody);

        // Execute POST request
        response = util.requestSetup()
                .body(jsonBody)
                .when()
                .post(bookingRequest.getEndPoint());

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
    }

    @Then("user should get the response code {int}")
    public void user_should_get_the_response_code(Integer statusCode) {
        Assert.assertEquals(Long.valueOf(response.getStatusCode()), Long.valueOf(statusCode));
    }
}