package com.wb.dbtool.javafx.manger;

import freemarker.cache.ClassTemplateLoader;
import freemarker.cache.TemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.Properties;

public class FreeMarkerManager {
    private FreeMarkerConfigurer freeMarkerConfigurer;

    public FreeMarkerManager() {
        freeMarkerConfigurer = new FreeMarkerConfigurer();

        // 初始化一些配置
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_28);
        cfg.setDefaultEncoding("UTF-8");
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        cfg.setTemplateLoader(new ClassTemplateLoader(FreeMarkerManager.class, "/modules"));
//        cfg.setClassicCompatible(true);
        freeMarkerConfigurer.setConfiguration(cfg);
    }

    public void outputTemp(File outfile, String template, Object model) {
        try {
            if (!outfile.exists()) {
                outfile.createNewFile();
            }

            //获取连接
            Configuration configuration = freeMarkerConfigurer.getConfiguration();
            //获取ftl,由于已经在配置文件中配置了路径所以在这里直接写模板名称就可以
            Template temp = configuration.getTemplate(template);
            //输出文件路径
            Writer wr = new FileWriter(outfile);
            //写入
            temp.process(model, wr);
            //关闭流
            wr.close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }
}
