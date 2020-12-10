package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.CalVO;
import com.example.mapper_oracle.CalMapper;

@Controller
public class CalController {
	@Autowired
	CalMapper calMapper;
	
	// 일정 첫page로 연결한다. 
	@RequestMapping("FullCalendar-Example-master/schedule")
	public void schedule(){}
	
	// 일정을 만드는 page로 연결해준다, groub에서도 사용한다. 
	@RequestMapping("/schedule_makeSchedule")
	public void schedule_makeSchedule(){	
	}
	
	// 일정을 만들고, 일정 첫page로 연결한다.
	@RequestMapping("makeCal")
	public String makeCal(CalVO vo,HttpSession session){	
		vo.setId((String) session.getAttribute("id"));
		calMapper.makeCal(vo);
		return "schedule_makeSchedule";
	}
}
