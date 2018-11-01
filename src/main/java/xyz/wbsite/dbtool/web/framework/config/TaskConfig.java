package xyz.wbsite.dbtool.web.framework.config;

import xyz.wbsite.dbtool.web.framework.utils.LogUtil;
import xyz.wbsite.dbtool.web.framework.utils.ProcessUtil;
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
        boolean process = ProcessUtil.findProcess("sunny.exe");
        if (!process){
            ProcessUtil.execExe("D:/windows_amd64/sunny.exe clientid 201822147996");
        }
    }

    /**
     * 开启多线程执行任务
     * @param scheduledTaskRegistrar
     */
    @Override
    public void configureTasks(ScheduledTaskRegistrar scheduledTaskRegistrar) {
        scheduledTaskRegistrar.setScheduler(Executors.newScheduledThreadPool(3));
    }
}
