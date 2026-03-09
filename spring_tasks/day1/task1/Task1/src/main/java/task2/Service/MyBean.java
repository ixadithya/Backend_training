package task2;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.stereotype.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component
public class MyBean implements InitializingBean, DisposableBean {

    private static final Logger logger = LoggerFactory.getLogger(MyBean.class);

    public MyBean() {
        logger.info("1 Bean created");
    }

    @PostConstruct
    public void init1() {
        logger.info("2 @PostConstruct called");
    }

    @Override
    public void afterPropertiesSet() {
        logger.info("3 afterPropertiesSet()");
    }

    public void run() {
        logger.info("4 Bean working");
    }

    @PreDestroy
    public void end1() {
        logger.info("5 @PreDestroy called");
    }

    @Override
    public void destroy() {
        logger.info("6 destroy()");
    }
}
