package com.it.wecodeyou.off_session.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.it.wecodeyou.off_session.model.LectureMessage;
import com.it.wecodeyou.off_session.model.MessageType;

@Controller
public class MessageController {

	private final SimpMessagingTemplate template;

	
	  @Autowired public MessageController(SimpMessagingTemplate template) {
	  this.template = template; }
	 

	@MessageMapping("/message/join")
	public void join(@Payload LectureMessage message) {
		System.out.println("Message Request: /message/join");
		message.setMessage(message.getWriter() + "님이 입장하셨습니다.");
		template.convertAndSend("/topic/off/room/" + message.getId(), message);
	}

	@MessageMapping("/message/make")
	public void make(@Payload LectureMessage message) {
		System.out.println("Message Request: /message/make");
		message.setMessage(message.getWriter() + "님의 세션이 시작되었습니다. &nbsp 좋은 수업!");
		template.convertAndSend("/topic/off/room/" + message.getId(), message);
	}

	@MessageMapping("/message/note")
	public void message(@Payload LectureMessage message) {
		System.out.println("Message Request: /message/note");
		template.convertAndSend("/topic/off/room/" + message.getId(), message);
	}
	
}
