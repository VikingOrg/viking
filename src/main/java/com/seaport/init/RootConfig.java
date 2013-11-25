package com.seaport.init;

import java.util.Properties;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@ComponentScan("com.seaport")
@PropertySource("classpath:application.properties")
@ImportResource("classpath:spring-security.xml")
public class RootConfig {
	
    private static final String PROPERTY_NAME_DATABASE_DRIVER = "db.driver";
    private static final String PROPERTY_NAME_DATABASE_PASSWORD = "db.password";
    private static final String PROPERTY_NAME_DATABASE_URL = "db.url";
    private static final String PROPERTY_NAME_DATABASE_USERNAME = "db.username";
	
    private static final String PROPERTY_NAME_HIBERNATE_DIALECT = "hibernate.dialect";
    private static final String PROPERTY_NAME_HIBERNATE_SHOW_SQL = "hibernate.show_sql";
    private static final String PROPERTY_NAME_ENTITYMANAGER_PACKAGES_TO_SCAN = "entitymanager.packages.to.scan";
    	
	@Resource
	private Environment env;
	
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		
		dataSource.setDriverClassName(env.getRequiredProperty(PROPERTY_NAME_DATABASE_DRIVER));
		String dbHost = envVarWithDefault("OPENSHIFT_DB_HOST", "localhost");
		String dbPort = envVarWithDefault("OPENSHIFT_DB_PORT", "3306");
		String dbDb = envVarWithDefault("OPENSHIFT_APP_NAME", "viking");
		dataSource.setUrl("jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbDb + "?characterEncoding=utf8&useUnicode=true");
		dataSource.setUsername(envVarWithDefault("OPENSHIFT_MYSQL_DB_USERNAME", "adminIYYgA5H"));
		dataSource.setPassword(envVarWithDefault("OPENSHIFT_MYSQL_DB_PASSWORD", "UwZtWWwLYbPh"));
		System.out.println("---->>>>" + dbHost + ":::" + dbPort + ":::" + dbDb);
		return dataSource;
	}
	
	private String envVarWithDefault(String envVarName, String defaultValue) {
		String value = System.getenv(envVarName);
		if (value == null || value.length() == 0) value = defaultValue;
		return value;
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
		properties.put(PROPERTY_NAME_HIBERNATE_DIALECT, env.getRequiredProperty(PROPERTY_NAME_HIBERNATE_DIALECT));
		properties.put(PROPERTY_NAME_HIBERNATE_SHOW_SQL, env.getRequiredProperty(PROPERTY_NAME_HIBERNATE_SHOW_SQL));

		properties.setProperty("hibernate.format_sql", "true");
		properties.setProperty("hibernate.default_schema", env.getProperty("hibernate.default.schema"));
		properties.setProperty("hibernate.generate_statistics", "true");
//		properties.setProperty("hibernate.connection.datasource", env.getProperty("jndi.name"));
		
//		properties.setProperty("hibernate.connection.useUnicode", "true");
//		properties.setProperty("hibernate.connection.characterEncoding", "UTF-8");
//		properties.setProperty("hibernate.connection.charSet", "UTF-8");
		
		return properties;	
	}
	
	@Bean
	public HibernateTransactionManager transactionManager() {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager();
		transactionManager.setSessionFactory(sessionFactory().getObject());
		return transactionManager;
	}
	
	
}
