package com.it.wecodeyou.off_session.model;

import com.it.wecodeyou.member.model.MemberVO;

public class LectureMessage {
	
	//오프라인 수업의 productNo
    private Integer id;
    //멤버 넘버
    private String writer;
    //메시지
    private String message;
    //메시지 타입. enum에 타입들을 정의
    private MessageType type;
    
    
	public LectureMessage() {}
	
	public LectureMessage(Integer id, MemberVO member, String message, MessageType type) {
		super();
		this.id = id;
		this.writer = member.getUserName();
		this.message = message;
		this.type = type;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public MessageType getType() {
		return type;
	}
	public void setType(MessageType type) {
		this.type = type;
	}
    
    
}
