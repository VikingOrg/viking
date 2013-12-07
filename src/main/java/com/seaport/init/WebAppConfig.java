package com.seaport.init;

import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan("com.seaport.controller")
@ImportResource("classpath:trace-context.xml")
public class WebAppConfig extends WebMvcConfigurerAdapter{
	
//    @Bean  
//    public ResourceBundleMessageSource messageSource() {  
//        ResourceBundleMessageSource source = new ResourceBundleMessageSource();  
////        source.setBasename("i18n/messages");
//        source.setBasename("classpath:/i18n/messages");
//        source.setDefaultEncoding("UTF-8");        
//        source.setUseCodeAsDefaultMessage(true);  
//        return source;  
//    } 
    
    @Bean
    public ReloadableResourceBundleMessageSource messageSource(){
    	/*Reloadable used to avoid JVM restart*/
	    ReloadableResourceBundleMessageSource messageSource=new ReloadableResourceBundleMessageSource();
	    messageSource.setDefaultEncoding("UTF-8");        
	    messageSource.setUseCodeAsDefaultMessage(true);  
	    String[] resources= {"classpath:/i18n/labels","classpath:/i18n/messages", "classpath:ValidationMessages"};
	    messageSource.setBasenames(resources);
	    return messageSource;
    }
    
    @Bean
    public SessionLocaleResolver localeResolver(){
        SessionLocaleResolver localeResolver = new SessionLocaleResolver();
        localeResolver.setDefaultLocale(new Locale("en","en"));
        return localeResolver;
    }
    
//    @Bean
//    public CookieLocaleResolver localeResolver(){
//    	CookieLocaleResolver localeResolver = new CookieLocaleResolver();
//        localeResolver.setDefaultLocale(new Locale("en","EN"));
//        return localeResolver;
//    }    
    
    @Bean 
    public LocaleChangeInterceptor localeChangeInterceptor(){
        LocaleChangeInterceptor localeChangeInterceptor=new LocaleChangeInterceptor();
        localeChangeInterceptor.setParamName("lang");
        return localeChangeInterceptor;
    }
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(localeChangeInterceptor());
    }
    
	@Bean
	public UrlBasedViewResolver setupViewResolver() {
		UrlBasedViewResolver resolver = new UrlBasedViewResolver();
		resolver.setPrefix("/WEB-INF/jsp/");
		resolver.setSuffix(".jsp");
		resolver.setViewClass(JstlView.class);
		return resolver;
	}
	
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("/static/").setCachePeriod(31556926);
        registry.addResourceHandler("/favicon.ico").addResourceLocations("/favicon.ico");
    }

}
