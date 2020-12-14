package com.example.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping("schedule_makeSchedule")
	public void schedule_makeSchedule(){	
	}
	
	
	
	@RequestMapping("scheduleList")
	@ResponseBody
	public List<CalVO> scheduleList(HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<CalVO> list = calMapper.scheduleList(id);
		for (int i =0; i<list.size(); i++){
			CalVO vo = list.get(i);
			if(vo.getAllDay().equals("0")){
			}
			SimpleDateFormat sdf = new SimpleDateFormat();
			
		}
		
		return calMapper.scheduleList(id);
	}
}
