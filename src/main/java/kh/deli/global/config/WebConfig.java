package kh.deli.global.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.navercorp.lucy.security.xss.servletfilter.XssEscapeServletFilter;
import kh.deli.global.interceptor.DomainInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor
public class WebConfig implements WebMvcConfigurer {

    @Autowired
    DomainInterceptor domainInterceptor;

    private final ObjectMapper objectMapper;

    //Lucy Xss filter 적용
//    @Bean
//    public FilterRegistrationBean xssFilterBean(){
//        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
//        registrationBean.setFilter(new XssEscapeServletFilter());
//        registrationBean.setOrder(Ordered.LOWEST_PRECEDENCE);
//        registrationBean.addUrlPatterns("/test");
////        registrationBean.addUrlPatterns("/**","*.jsp");
////        registrationBean.addUrlPatterns("/stores/review/**","/main/kakaoSignUp","/main/memberSignUp","/myPage/**");
//        return registrationBean;
//    }
//
//    //requestBody xss 필터 적용(json/api)ss
//    @Bean
//    public MappingJackson2HttpMessageConverter jsonEscapeConverter() {
//        ObjectMapper copy = objectMapper.copy();
//        copy.getFactory().setCharacterEscapes(new HtmlCharacterEscapes());
//        return new MappingJackson2HttpMessageConverter(copy);
//    }

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
