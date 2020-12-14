package com.example.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.EventVO;
import com.example.domain.PageMaker;
import com.example.mapper_oracle.EventMapper;

@Controller
public class EventController {
	@Autowired
	EventMapper mapper;
	
	// 이벤트 첫 page로 연결한다
	@RequestMapping("event")
	public void event(){
	}
	
	// 이벤트를 ajax으로 보내준다 pageing을 하기 위해
	@RequestMapping("eventList")
	@ResponseBody
	public HashMap<String , Object> eventList(int page,String query){
		HashMap<String , Object> map= new HashMap<>();
		   
		PageMaker pm = new PageMaker();
		Criteria cri = new Criteria(1,5);
		cri.setPage(page);
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(query));
		  
		map.put("pm", pm);
		map.put("elist",mapper.elist(query,cri));
		map.put("query",query);
		return map;
	}	
	
	
	
	// 이벤트를 읽을때 작성자가 들어갔을떄는 update page로, 일반 회원이 들어갔을떄는 read page로 연결해준다
	@RequestMapping("event_read")
	public String cnRead(int e_no, Model model,HttpSession session) {
		session.setAttribute("e_no", e_no);
		EventVO evo = mapper.eread(e_no);
		 
		model.addAttribute("evo", evo);
		if(evo.getId().equals((String)session.getAttribute("id"))){
			return "event_update";
		}
		return "event_read";
	}
	
	// 이벤트를 작성하는 page로 연결해준다
	@RequestMapping("createMasterEvent")
	public String createMasterEvent(HttpSession session){
			
		// 로그인한 아이디가 관리자 아이디인지 확인한다. 
		String id = (String) session.getAttribute("id");
		if(id==null){
			System.out.println("로그인부터 해 이 자식아....");
			return "redirect:event";
		}else{
			if(id.equals("master")){
				return "createMasterEvent";
			}else{
				System.out.println("넌 글을 못써 친구야...");
				return "redirect:event";
			}
		}		
	}
	
	// 이벤트를 작성한다.
	@RequestMapping(value="createEvent", method=RequestMethod.POST)
	public String createEvent(EventVO vo,HttpSession session){
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		mapper.einsert(vo);

		return "redirect:event";
	}
	
	
	// 이벤트을 업데이트 했을 떄 실행
	@RequestMapping(value = "event_updatePost", method = RequestMethod.POST)
	public String event_updatePost(EventVO vo, HttpSession session) {
	   mapper.eupdatepost(vo);
	   return "redirect:event";
	}
	
	// 게시물을 삭제할떄 실행
	@RequestMapping("event_delete")
	public String event_delete(int e_no, HttpSession session){
		mapper.edelete(e_no);
		return "redirect:event";
	}
	
}