<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.1.2.RELEASE</version>
        <relativePath/>
    </parent>
    <groupId>${basePackage}</groupId>
    <artifactId>${projectName}</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <packaging>jar</packaging>
    <!--<packaging>war</packaging>--><!--需要打包成war时放开-->
    <name>${projectName}</name>
    <description>project for Spring Boot</description>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
        <java.version>1.8</java.version>
        <maven.test.skip>true</maven.test.skip>
        <commons-io-version>2.6</commons-io-version>
        <pagehelper-version>1.2.5</pagehelper-version>
        <mybatis-version>1.3.2</mybatis-version>
        <dozer-version>5.5.1</dozer-version>
        <spring-cloud.version>Greenwich.RC2</spring-cloud.version>
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.mybatis.spring.boot</groupId>
            <artifactId>mybatis-spring-boot-starter</artifactId>
        </dependency>

        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>

        <dependency>
            <groupId>commons-io</groupId>
            <artifactId>commons-io</artifactId>
        </dependency>

        <!-- mybatis 分页插件  -->
        <dependency>
            <groupId>com.github.pagehelper</groupId>
            <artifactId>pagehelper-spring-boot-starter</artifactId>
        </dependency>

        <!-- freemarker  -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-freemarker</artifactId>
        </dependency>

        <!-- eureka-client  -->
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>
        </dependency>

        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-netflix-ribbon</artifactId>
        </dependency>

        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-openfeign</artifactId>
        </dependency>

        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-devtools</artifactId>
            <scope>provided</scope>
            <optional>true</optional>
        </dependency>

        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>

        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-security</artifactId>
        </dependency>

        <dependency>
            <groupId>net.sf.dozer</groupId>
            <artifactId>dozer</artifactId>
        </dependency>

<#if dataBase == 'MYSQL'>
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <scope>runtime</scope>
        </dependency>
</#if>

<#if dataBase == 'ORACLE'>
        <dependency>
            <groupId>com.example</groupId>
            <artifactId>ojdbc</artifactId>
            <version>0.0.1</version>
            <scope>system</scope>
            <systemPath>${r'${project.basedir}/src/main/resources/lib/ojdbc7-12.1.0.2.jar'}</systemPath>
        </dependency>
</#if>
    </dependencies>

    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>org.springframework.cloud</groupId>
                <artifactId>spring-cloud-dependencies</artifactId>
                <version>${r'${spring-cloud.version}'}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
            <dependency>
                <groupId>com.github.pagehelper</groupId>
                <artifactId>pagehelper-spring-boot-starter</artifactId>
                <version>${r'${pagehelper-version}'}</version>
            </dependency>
            <dependency>
                <groupId>org.mybatis.spring.boot</groupId>
                <artifactId>mybatis-spring-boot-starter</artifactId>
                <version>${r'${mybatis-version}'}</version>
            </dependency>
            <dependency>
                <groupId>net.sf.dozer</groupId>
                <artifactId>dozer</artifactId>
                <version>${r'${dozer-version}'}</version>
            </dependency>
            <dependency>
                <groupId>commons-io</groupId>
                <artifactId>commons-io</artifactId>
                <version>${r'${commons-io-version}'}</version>
            </dependency>
        </dependencies>
    </dependencyManagement>

    <build>
        <!-- 项目名称 -->
        <finalName>${r"${artifactId}"}-${r"${version}"}</finalName>
        <!-- 默认的主代码目录 -->
        <sourceDirectory>src/main/java</sourceDirectory>
        <!-- 默认的测试代码目录 -->
        <testSourceDirectory>src/test/java</testSourceDirectory>
        <resources>
            <resource>
                <directory>src/main/resources</directory>
            </resource>
            <!-- 包含java下的xml文件 -->
            <resource>
                <directory>src/main/java</directory>
                <includes>
                    <include>**/mpr/*.xml</include>
                </includes>
            </resource>
            <!-- 包含lib中所有jar包 -->
            <resource>
                <directory>${r'${basedir}'}/src/main/resources/lib</directory>
                <targetPath>BOOT-INF/lib/</targetPath>
                <includes>
                    <include>*.jar</include>
                </includes>
            </resource>
            <!-- 启动bat -->
            <resource>
                <directory>${r'${basedir}'}/src/main/resources</directory>
                <includes>
                    <include>*.bat</include>
                </includes>
                <targetPath>${r'${basedir}'}/target</targetPath>
            </resource>
        </resources>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <configuration>
                    <source>1.8</source>
                    <target>1.8</target>
                    <encoding>UTF-8</encoding>
                    <compilerArguments>
                        <extdirs>${r'${project.basedir}/src/main/resources/lib'}</extdirs>
                    </compilerArguments>
                </configuration>
            </plugin>

            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-war-plugin</artifactId>
                <configuration>
                    <webResources>
                        <resource>
                            <directory>${r'${project.basedir}/src/main/resources/lib'}</directory>
                            <targetPath>WEB-INF/lib</targetPath>
                            <includes>
                                <include>*.jar</include>
                            </includes>
                        </resource>
                    </webResources>
                </configuration>
            </plugin>
        </plugins>
    </build>

    <repositories>
        <repository>
            <id>spring-milestones</id>
            <name>Spring Milestones</name>
            <url>https://repo.spring.io/milestone</url>
        </repository>
    </repositories>
</project>
