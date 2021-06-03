package dev.mvc.study_maria;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import dev.mvc.tool.Download;

@Configuration
public class ServletRegister {
  @Bean
  public ServletRegistrationBean getServletRegistrationBean()  {

    // urlPatterns: /download?dir=/contents/storage&filename=winter_1.jpg&downname=winter.jpg
    // urlPatterns: /download?dir=/attachfile/storage&filename=winter_1.jpg&downname=winter.jpg
    ServletRegistrationBean registrationBean = new ServletRegistrationBean(new Download());
    registrationBean.addUrlMappings("/download"); // 접근주소		
    
    return registrationBean;
  }
}