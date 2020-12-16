package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.CalVO;
import com.example.domain.GroupVO;
import com.example.mapper_oracle.CalMapper;

@Controller
public class CalController {
	@Autowired
	CalMapper calMapper;

	// 일정 첫page로 연결한다.
	@RequestMapping("schedule")
	public void schedule() {
	}

	// 일정을 만드는 page로 연결해준다, groub에서도 사용한다.
	@RequestMapping("schedule_makeSchedule")
	public void schedule_makeSchedule() {
	}

	@RequestMapping("calmygroup")
	@ResponseBody
	public GroupVO calmygroup(HttpSession session) {
		String id = (String) session.getAttribute("id");
		return calMapper.calmygroup(id, 363);
	}
	
	@RequestMapping("group_scheduleList")
	@ResponseBody
	public List<CalVO> group_scheduleList(int g_code,HttpSession session) {
		session.setAttribute("g_code", g_code);
		
		List<CalVO> listvo = calMapper.scheduleList(g_code);
		for(CalVO vo : listvo){
			if(vo.getAllDay().equals("1")){
				vo.setAllDayjs(true);
				
			}else if(vo.getAllDay().equals("0")){
				vo.setAllDayjs(false);
	
			}
			
			if(vo.getSchk().equals("1")){
				vo.setSchkjs(true);
			}else if(vo.getSchk().equals("0")){
				vo.setSchkjs(false);
			}
			
		}	
		return listvo;
		
	}
		
	
	

	@RequestMapping("scheduleinsert")
	public void scheduleinsert(CalVO vo,HttpSession session) {
		String id = (String) session.getAttribute("id");
		vo.setUsername(id);
		String color = vo.getBackgroundColor();
		String[] array = color.split("#");
		color = array[1];
		vo.setBackgroundColor(color);	
		calMapper.scheduleinsert(vo);
	}

	@RequestMapping("scheduleupdate")
	public void scheduleupdate(CalVO vo) {
		System.out.println("컨트롤러");
		if(vo.getAllDay().equals("true")){
			vo.setAllDay("1");
		}else{
			vo.setAllDay("0");
		}
		String color = vo.getBackgroundColor();
		String[] array = color.split("#");
		color = array[1];
		vo.setBackgroundColor(color);
		System.out.println(vo);
		calMapper.scheduleupdate(vo);
	}

	@RequestMapping("dragupdate")
	public void dragupdate(CalVO vo) {
		System.out.println(vo);
		calMapper.dragupdate(vo);
	}
	
	@RequestMapping("scheduledelete")
	   public void scheduledelete(int calno){
		
	      calMapper.scheduledelete(calno);
	   }
}
