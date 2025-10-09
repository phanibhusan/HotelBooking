package utilis;
	

import java.io.FileInputStream;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class LoadProperties {

		private static FileInputStream input;
		//private static Properties prop = null;
		private static final Logger LOG = LogManager.getLogger(LoadProperties.class);
		private static Properties prop = new Properties();
		public static String getProperty(String key) {
	        InputStream input = null;
	        try {
	            input = LoadProperties.class.getClassLoader().getResourceAsStream("common.properties");
	            if (input == null) {
	                throw new FileNotFoundException("Property file 'config.properties' not found in classpath");
	            }
	            prop.load(input);
	            return prop.getProperty(key);
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        } finally {
	            if (input != null) {
	                try {
	                    input.close();
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	    }
	}
		