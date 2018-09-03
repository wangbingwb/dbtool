package ${basePackage}.framework.config;

import ${basePackage}.framework.utils.LogUtil;
import ${basePackage}.framework.utils.ProcessUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;

import java.util.concurrent.Executors;

/**
 * Task配置，默认只在开发环境生效,根据实际情况是否需要Task选择开启
 * 开启方法:将@Profile("dev") 删除(所有环境生效) 或改为 @Profile("prod")(只对生产环境生效)
 */
@Configuration
@EnableScheduling
@Profile("prod")
public class TaskConfig  implements SchedulingConfigurer {

    @Scheduled(cron="0/30 * * * * ? ")
    public void task(){
        LogUtil.i("--------------------Task--------------------");
    }

    /**
     * Spring的 Schedule 默认是单线程执行
     * 若要多线程并行运行任务 需实现SchedulingConfigurer并重写configureTasks方法
     *
     * @param scheduledTaskRegistrar
     */
    @Override
    public void configureTasks(ScheduledTaskRegistrar scheduledTaskRegistrar) {
        scheduledTaskRegistrar.setScheduler(Executors.newScheduledThreadPool(3));
    }
}
