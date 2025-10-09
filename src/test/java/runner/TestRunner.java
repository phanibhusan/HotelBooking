package runner;

import org.junit.runner.RunWith;
import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@SuppressWarnings("deprecation")
@RunWith(Cucumber.class)
@CucumberOptions(
    features = "src/test/resources/features/booking.feature",
    glue = {"stepDefinitions"},
    dryRun = false,
    plugin = {
        "pretty",                          // detailed console output
        "summary",                         // concise summary at the end
        "html:target/cucumber-report.html", // HTML report
        "json:target/cucumber-report.json"  // JSON report
    },
    monochrome = true,
    publish = true,
    tags= "Happypath"
)
public class TestRunner {
}