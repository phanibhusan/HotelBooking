package utilis;
	

import java.io.FileInputStream;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class loadproperties {

		private static FileInputStream input;
		private static Properties prop = null;
		private static final Logger LOG = LogManager.getLogger(loadproperties.class);

		public static String getProperty(final String key) {

			try {
				input = new FileInputStream("src/test/java/Config/common.properties");
				prop = new Properties();
				prop.load(input);
			} catch (FileNotFoundException FileNotFoundException) {
				LOG.error("Properties File Not Found", FileNotFoundException);
			} catch (IOException IOException) {
				// TODO Auto-generated catch block
				LOG.error("IO Exception when loading properties  ", IOException);
			} finally {
				try {
					input.close();
				} catch (IOException IOException) {
					LOG.error("IO Exception when closing properties", IOException);
				}
			}
			return prop.getProperty(key);
		}
}
		