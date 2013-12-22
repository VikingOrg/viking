package com.seaport.init;

import java.util.Properties;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.seaport.utils.SystemConstants;

@Configuration
@EnableTransactionManagement
@ComponentScan("com.seaport")
@PropertySource("classpath:application.properties")
@ImportResource("classpath:spring-security.xml")
public class RootConfig {
	
    private static final String PROPERTY_NAME_DATABASE_DRIVER = "db.driver";
    private static final String PROPERTY_NAME_DATABASE_PASSWORD = "db.password";
    private static final String PROPERTY_NAME_DATABASE_NAME = "db.name";
    private static final String PROPERTY_NAME_DATABASE_USERNAME = "db.username";
	
    private static final String PROPERTY_NAME_HIBERNATE_DIALECT = "hibernate.dialect";
    private static final String PROPERTY_NAME_HIBERNATE_SHOW_SQL = "hibernate.show_sql";
    private static final String PROPERTY_NAME_HIBERNATE_SCHEMA = "hibernate.default_schema";
    private static final String PROPERTY_NAME_HIBERNATE_FORMAT_SQL = "hibernate.format_sql";
    
    private static final String PROPERTY_NAME_ENTITYMANAGER_PACKAGES_TO_SCAN = "entitymanager.packages.to.scan";
    private static final String PROPERTY_RESPONSIVE_SETTING = "responsive.design";
    
    	
	@Resource
	private Environment env;
	
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(env.getRequiredProperty(PROPERTY_NAME_DATABASE_DRIVER));
		String dbHost = envVarWithDefault("OPENSHIFT_MYSQL_DB_HOST", "localhost");
		String dbPort = envVarWithDefault("OPENSHIFT_MYSQL_DB_PORT", "3306");
		String dbDb = envVarWithDefault("OPENSHIFT_APP_NAME", env.getRequiredProperty(PROPERTY_NAME_DATABASE_NAME));
		dataSource.setUrl("jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbDb + "?characterEncoding=utf8&useUnicode=true");
		dataSource.setUsername(envVarWithDefault("OPENSHIFT_MYSQL_DB_USERNAME", env.getRequiredProperty(PROPERTY_NAME_DATABASE_USERNAME)));
		dataSource.setPassword(envVarWithDefault("OPENSHIFT_MYSQL_DB_PASSWORD", env.getRequiredProperty(PROPERTY_NAME_DATABASE_PASSWORD)));
		return dataSource;
	}
 
	private String envVarWithDefault(String envVarName, String defaultValue) {
		String value = System.getenv(envVarName);
		if (value == null || value.length() == 0) value = defaultValue;
		return value;
	}
	
	@Bean
//	@Scope("prototype")
	public SystemConstants systemConstants(){
		SystemConstants systemConstants = new SystemConstants();
		String value = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
		if (value == null) {
			systemConstants.setLocalConfig(true);
		}
		String respDesign = env.getRequiredProperty(PROPERTY_RESPONSIVE_SETTING);
		if (respDesign.equalsIgnoreCase("true")) {
			systemConstants.setResponsiveDesign(true);
		}
		return systemConstants;
	}
	
	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean sessionFactoryBean = new LocalSessionFactoryBean();
		sessionFactoryBean.setDataSource(dataSource());
		sessionFactoryBean.setPackagesToScan(env.getRequiredProperty(PROPERTY_NAME_ENTITYMANAGER_PACKAGES_TO_SCAN));
		sessionFactoryBean.setHibernateProperties(hibProperties());
		return sessionFactoryBean;
	}
	
	private Properties hibProperties() {
		Properties properties = new Properties();
		properties.put(PROPERTY_NAME_HIBERNATE_SCHEMA, env.getProperty(PROPERTY_NAME_HIBERNATE_SCHEMA));
		properties.put(PROPERTY_NAME_HIBERNATE_DIALECT, env.getRequiredProperty(PROPERTY_NAME_HIBERNATE_DIALECT));
		properties.put(PROPERTY_NAME_HIBERNATE_SHOW_SQL, env.getRequiredProperty(PROPERTY_NAME_HIBERNATE_SHOW_SQL));
		properties.put(PROPERTY_NAME_HIBERNATE_FORMAT_SQL, env.getRequiredProperty(PROPERTY_NAME_HIBERNATE_FORMAT_SQL));
		return properties;	
	}
	
	@Bean
	public HibernateTransactionManager transactionManager() {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager();
		transactionManager.setSessionFactory(sessionFactory().getObject());
		return transactionManager;
	}
}
