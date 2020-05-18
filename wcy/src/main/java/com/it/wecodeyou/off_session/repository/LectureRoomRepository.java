package com.it.wecodeyou.off_session.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.it.wecodeyou.member.model.MemberVO;
import com.it.wecodeyou.off.model.OffProductVO;
import com.it.wecodeyou.off_session.model.LectureRoom;
import com.it.wecodeyou.purchase.model.PurchaseVO;

@Repository
public class LectureRoomRepository {
    private final Map<String, LectureRoom> lectureRoomMap;
    
	public LectureRoomRepository() {

		lectureRoomMap = new HashMap<>();
    }

    public LectureRoom getlectureRoom(String id) {
        return lectureRoomMap.get(id);
    }

    public void remove(String id) {
    	lectureRoomMap.remove(id);
    }
    
    public void create(OffProductVO opvo, MemberVO mvo) {
    	lectureRoomMap.put("" + opvo.getProductNo(), new LectureRoom(opvo, mvo));
    }
    
    public List<LectureRoom> getActiveSession(List<PurchaseVO> purchases){
    	List<LectureRoom> actives = new ArrayList<LectureRoom>();
    	for(Map.Entry<String,LectureRoom> elem : lectureRoomMap.entrySet()) {
    		for(PurchaseVO pvo : purchases) {
    			if(elem.getKey().equals("" +pvo.getPurchaseProNo())) {
    				actives.add(elem.getValue());
    			}
    		}
    	}
    	return actives;
    }
    
    public LectureRoom findLecture(String id) {
    	return lectureRoomMap.get(id);
    }
}