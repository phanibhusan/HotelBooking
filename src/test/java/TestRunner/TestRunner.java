package TestRunner;

import io.cucumber.testng.CucumberOptions;

//@RunWith(CucumberOptions.class)
@CucumberOptions(
		features = "src/test/resources/features",

		glue = {"StepDefinations"}, 
		dryRun=false,

		plugin = {"pretty", // pretty-printed logs in console
	    "summary", // clean summary at the end
	    "html:target/cucumber-report.html", // HTML report
	    "json:target/cucumber-report.json" // JSON report
	     },
         monochrome = true,
         tags = "CreateBooking"

)

public class TestRunner {

}
