package com.mc.mybook.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
//	@Autowired
//	private UserDetailService service;
	
	// description : 유저 인증정보를 설정 할 수 있다. jdbc 인증정보 연결
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		auth.userDetailsService(service).passwordEncoder(passwordEncoder());
	}
	
	// description : static file 같은 인증이 필요없는 리소스를 이곳에서 설정한다.
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/css", "/js", "/built");
	}
	
	// description : 리소스 보안 부분
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
			.antMatchers("/").permitAll()
			.antMatchers("/js/**").permitAll()
			.and()
			.csrf().disable();
	}
	
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
