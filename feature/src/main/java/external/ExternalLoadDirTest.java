package external;

import java.util.logging.Logger;

/**
 * Created by JasonFitch on 10/18/2019.
 */
public class ExternalLoadDirTest {
    public static Logger logger = Logger.getLogger(ExternalLoadDirTest.class.getName());

    static {
        String file = ExternalLoadDirTest.class.getProtectionDomain().getCodeSource().getLocation().getFile();
        logger.info(file);

        ClassLoader classLoader = ExternalLoadJarTest.class.getClassLoader();
        while (classLoader != null) {
            logger.info(classLoader.toString());
            classLoader = classLoader.getParent();
        }
    }

}
