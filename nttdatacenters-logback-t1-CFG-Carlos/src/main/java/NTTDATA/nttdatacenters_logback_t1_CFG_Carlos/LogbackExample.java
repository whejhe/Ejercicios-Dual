package NTTDATA.nttdatacenters_logback_t1_CFG_Carlos;

import org.slf4j.*;

public class LogbackExample {
	
	private static Logger logger = LoggerFactory.getLogger(LogbackExample.class);

	public static void main(String[] args) {
	
		logger.debug("Hola");
		logger.info("Mensaje informativo");
		logger.warn("Alerta");
		logger.error("Error");
	}

}
