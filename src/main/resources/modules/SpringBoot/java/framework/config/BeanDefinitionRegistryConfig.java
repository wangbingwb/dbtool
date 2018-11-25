package ${basePackage}.framework.config;

import ${basePackage}.framework.base.Control;
import ${basePackage}.framework.base.Screen;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.support.BeanDefinitionRegistryPostProcessor;
import org.springframework.beans.factory.support.BeanNameGenerator;
import org.springframework.context.annotation.ClassPathBeanDefinitionScanner;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.type.classreading.MetadataReader;
import org.springframework.core.type.classreading.MetadataReaderFactory;
import org.springframework.core.type.filter.TypeFilter;

import java.io.IOException;

@Configuration
public class BeanDefinitionRegistryConfig implements BeanDefinitionRegistryPostProcessor {
    public static final String SCREEN_PREFIX = "screen";
    public static final String CONTROL_PREFIX = "control";

    @Override
    public void postProcessBeanDefinitionRegistry(BeanDefinitionRegistry beanDefinitionRegistry) throws BeansException {
        String aPackage = this.getClass().getPackage().getName();
        int i = registryScreen(aPackage.replaceAll("framework.config", "action.screen"), beanDefinitionRegistry);
        int i1 = registryControl(aPackage.replaceAll("framework.config", "action.control"), beanDefinitionRegistry);
        System.out.println();
    }

    @Override
    public void postProcessBeanFactory(ConfigurableListableBeanFactory configurableListableBeanFactory) throws BeansException {

    }

    private int registryScreen(String basePackage, BeanDefinitionRegistry beanDefinitionRegistry) {
        ClassPathBeanDefinitionScanner classPathBeanDefinitionScanner = new ClassPathBeanDefinitionScanner(beanDefinitionRegistry);
        classPathBeanDefinitionScanner.addIncludeFilter(new TypeFilter() {
            @Override
            public boolean match(MetadataReader metadataReader, MetadataReaderFactory metadataReaderFactory) throws IOException {
                if (metadataReader.getClassMetadata().getSuperClassName().equals(Screen.class.getName())) {
                    return true;
                }
                return false;
            }
        });
        classPathBeanDefinitionScanner.setBeanNameGenerator(new BeanNameGenerator() {
            @Override
            public String generateBeanName(BeanDefinition beanDefinition, BeanDefinitionRegistry beanDefinitionRegistry) {
                String beanClassName = beanDefinition.getBeanClassName();
                String s = beanClassName.replaceAll(basePackage, SCREEN_PREFIX);
                return s.toLowerCase();
            }
        });
        return classPathBeanDefinitionScanner.scan(basePackage);
    }

    private int registryControl(String basePackage, BeanDefinitionRegistry beanDefinitionRegistry) {
        ClassPathBeanDefinitionScanner classPathBeanDefinitionScanner = new ClassPathBeanDefinitionScanner(beanDefinitionRegistry);
        classPathBeanDefinitionScanner.addIncludeFilter(new TypeFilter() {
            @Override
            public boolean match(MetadataReader metadataReader, MetadataReaderFactory metadataReaderFactory) throws IOException {
                if (metadataReader.getClassMetadata().getSuperClassName().equals(Control.class.getName())) {
                    return true;
                }
                return false;
            }
        });
        classPathBeanDefinitionScanner.setBeanNameGenerator(new BeanNameGenerator() {
            @Override
            public String generateBeanName(BeanDefinition beanDefinition, BeanDefinitionRegistry beanDefinitionRegistry) {
                String beanClassName = beanDefinition.getBeanClassName();
                String s = beanClassName.replaceAll(basePackage, CONTROL_PREFIX);
                return s.toLowerCase();
            }
        });
        return classPathBeanDefinitionScanner.scan(basePackage);
    }
}
