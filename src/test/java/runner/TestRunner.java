package runner;

import org.junit.runner.RunWith;
import io.cucumber.junit.Cucumber;

import io.cucumber.junit.CucumberOptions;

//import io.cucumber.testng.CucumberOptions;

@RunWith(Cucumber.class)
@SuppressWarnings({ "deprecation", "unused" })
@CucumberOptions(
		
		features = "src/test/resources/features/booking.feature",
		glue = {"stepdefinitions"}, 
		dryRun=false,

		plugin = {"pretty", // pretty-printed logs in console
	    "summary", // clean summary at the end
	    "html:target/cucumber-report.html", // HTML report
	    "json:target/cucumber-report.json" // JSON report
	     },
         monochrome = true,
         publish = true
         
)

public class TestRunner {}
