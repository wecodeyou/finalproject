package com.it.wecodeyou.off_session.model;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.it.wecodeyou.member.model.MemberVO;
import com.it.wecodeyou.off.model.OffProductVO;

public class LectureRoom {
	private String id;
	private String name;
	private OffProductVO info;
	private MemberVO master;
	private Set<MemberVO> memberSet;
	
	public LectureRoom (OffProductVO opvo, MemberVO master) {
		this.id = String.valueOf(opvo.getProductNo());
		this.name = opvo.getProductName();
		this.info = opvo;
		this.master = master;
		this.memberSet = new HashSet<MemberVO>();
	}

    public void join(MemberVO mvo) {
        memberSet.add(mvo);
    }
    
    public void remove(MemberVO mvo) {
    	memberSet.remove(mvo);
    }
    public MemberVO findMember(Integer memberNo) {
    	for(MemberVO mvo : memberSet) {
    		if(mvo.getUserNo() == memberNo) {
    			return mvo;
    		}
    	}
    	return null;
    }

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public OffProductVO getInfo() {
		return info;
	}

	public void setInfo(OffProductVO info) {
		this.info = info;
	}

	public MemberVO getMaster() {
		return master;
	}

	public void setMaster(MemberVO master) {
		this.master = master;
	}

	public Set<MemberVO> getMemberSet() {
		return memberSet;
	}

	public void setMemberSet(Set<MemberVO> memberSet) {
		this.memberSet = memberSet;
	}

    

}
