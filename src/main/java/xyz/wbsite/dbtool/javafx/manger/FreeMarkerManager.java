package xyz.wbsite.dbtool.javafx.manger;

import freemarker.cache.*;
import freemarker.template.*;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.lang.Nullable;
import org.springframework.ui.freemarker.SpringTemplateLoader;
import org.springframework.util.ClassUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.springframework.web.util.UriTemplate;

import java.io.*;
import java.net.URL;
import java.util.Properties;

public class FreeMarkerManager {
    private FreeMarkerConfigurer freeMarkerConfigurer;

    public FreeMarkerManager() {
        freeMarkerConfigurer = new FreeMarkerConfigurer();
        // 初始化一些配置
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_28);
        cfg.setDefaultEncoding("UTF-8");
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        cfg.setNumberFormat("0.##");

        MultiTemplateLoader multiTemplateLoader = new MultiTemplateLoader(new TemplateLoader[]{
                new ClassTemplateLoader(ClassUtils.getDefaultClassLoader(), "/modules"),
        });

        cfg.setTemplateLoader(multiTemplateLoader);
        freeMarkerConfigurer.setConfiguration(cfg);
    }

    public void outputTemp(File outfile, String template, Object model) {
        try {
            if (!outfile.exists()) {
                outfile.createNewFile();
            }

            //获取连接
            Configuration configuration = freeMarkerConfigurer.getConfiguration();
            //设置编码
            configuration.setDefaultEncoding("UTF-8");
            //获取ftl,由于已经在配置文件中配置了路径所以在这里直接写模板名称就可以
            Template temp = configuration.getTemplate(template);
            //输出文件路径
            Writer wr = new OutputStreamWriter(new FileOutputStream(outfile),"UTF-8");
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
