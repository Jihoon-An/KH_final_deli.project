package kh.deli.global.config;

import kh.deli.global.interceptor.DomainInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Autowired
    DomainInterceptor domainInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(domainInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/resources/**")
                .excludePathPatterns("/error/**")
                .excludePathPatterns("/")
                .excludePathPatterns("/alarm/**")
                .excludePathPatterns("/alarm/**")
                .excludePathPatterns("/WEB-INF/**")
                .excludePathPatterns("/account/**")
                .excludePathPatterns("/util/**")
                .excludePathPatterns("/ownerSignUp/**");
    }
}
