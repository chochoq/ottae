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

//	@RequestMapping("calmygroup")
//	@ResponseBody
//	public GroupVO calmygroup(HttpSession session) {
//		String id = (String) session.getAttribute("id");
//		return calMapper.calmygroup(id);
//	}
	
	@RequestMapping("group_scheduleList")
	@ResponseBody
	public List<CalVO> group_scheduleList(int g_code,HttpSession session) {
		session.setAttribute("g_code", g_code);
		return calMapper.scheduleList(g_code);
	}

	@RequestMapping("scheduleinsert")
	public void scheduleinsert(CalVO vo,HttpSession session) {
		String id = (String) session.getAttribute("id");
		vo.setUsername(id);
		String color = vo.getBackgroundColor();
		String[] array = color.split("#");
		color = array[1];
		vo.setBackgroundColor(color);	
		System.out.println(vo.toString());
		calMapper.scheduleinsert(vo);
	}

	@RequestMapping("scheduleupdate")
	public void scheduleupdate(CalVO vo) {
		calMapper.scheduleupdate(vo);
	}

	@RequestMapping("dragupdate")
	public void dragupdate(CalVO vo) {
		calMapper.dragupdate(vo);
	}
}
