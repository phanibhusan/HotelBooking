package TestRunner;

import org.junit.runner.RunWith;
import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;



@RunWith(Cucumber.class)
@CucumberOptions(
		features = "src/test/resources/features",

		glue = "stepdefinitions", dryRun=false,

		plugin = {"pretty", // pretty-printed logs in console
	    "summary", // clean summary at the end
	    "html:target/cucumber-report.html", // HTML report
	    "json:target/cucumber-report.json" // JSON report
	     },
         monochrome = true

)

public class TestRunner {

}
