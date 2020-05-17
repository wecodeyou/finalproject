package com.it.wecodeyou.off_session.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;


/*
 https://docs.spring.io/spring/docs/current/spring-framework-reference/web.html#websocket-stomp-benefits
 	이 클래스는 servlet-config에서 설정도 가능한데 XML로 작성하면 이렇다
  	<websocket:message-broker application-destination-prefix="/lecture">
		<websocket:stomp-endpoint path="/begin-sesssion">
    		<websocket:sockjs/>
		</websocket:stomp-endpoint>
		<websocket:stomp-broker-relay prefix="/topic, /queue"/>
	</websocket:message-broker>
	

*/

@Configuration
@EnableWebSocketMessageBroker
public class SessionConfiguration implements WebSocketMessageBrokerConfigurer {
	/*
	 *스톰프 웹 소켓의 Endpoint를 설정(쉽게 말해 처음 소켓에 연결하기 위해 요청하는  URL이라고 보면된다).
	 *클라이언트 사이드에서 Sock.js를 통해 요청가능
	 */ 
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/begin-session").setAllowedOrigins("*").withSockJS();
	}
	
	
	/*
	 * lecture가 포함된 요청은 @Controller에 있는 @MessageMapping 애노테이션이 있는 메서드로 이동
	 * topic과 queue는 웹 소켓의 Naming Convention으로 
	 * Topic은 one to many 메시지, Queue는 one to one 메시지를 뜻한다.
	 * 
	 */
	@Override
	public void configureMessageBroker(MessageBrokerRegistry config) {
		config.setApplicationDestinationPrefixes("/lecture");
		config.enableSimpleBroker("/topic", "/queue");
	}
	

}
