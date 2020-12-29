package com.example.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.CalVO;
import com.example.mapper_oracle.CalMapper;
import com.example.mapper_oracle.GroupMapper;
import com.example.mapper_oracle.UserMapper;

@Controller
public class CalController {
	@Autowired
	CalMapper calMapper;
	@Autowired
	GroupMapper gMapper;
	@Autowired
	UserMapper uMapper;
	// 일정 첫page로 연결한다.
	@RequestMapping("schedule")
	public void schedule(HttpSession session) {
	}

	@RequestMapping("g_pic")
	@ResponseBody
	public HashMap<String, Object> g_pic(int g_code, HttpSession session){
		HashMap<String, Object> map = new HashMap<>();
		String id = (String) session.getAttribute("id");
		if(g_code == 0)	{
			map.put("upic", gMapper.upic(id));
			System.out.println(map);
			return map;
		}else{
			map.put("gpic", gMapper.gread(g_code));
			System.out.println(map);
			return map;
		}
		
	}
	
	// 달력에 내가 원하는 정보 값을 보내준다.
	@RequestMapping("getScheduleList")
	@ResponseBody
	public List<CalVO> group_scheduleList(int g_code, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<CalVO> listvo;
		if(g_code == 0){
			listvo = calMapper.myscheduleList(id);
			for (CalVO vo : listvo) {
				if (vo.getAllDay().equals("1")) {
					vo.setAllDayjs(true);
				} else if (vo.getAllDay().equals("0")) {
					vo.setAllDayjs(false);
				}
			}
		}else{
			listvo = calMapper.scheduleList(g_code);
			for (CalVO vo : listvo) {
				if (vo.getAllDay().equals("1")) {
					vo.setAllDayjs(true);
				} else if (vo.getAllDay().equals("0")) {
					vo.setAllDayjs(false);
				}
			}
		}				
//		System.out.println("list"+listvo);
		return listvo;
	}

	// 일정을 저장한다 .
	@RequestMapping("scheduleinsert")
	@ResponseBody
	public void scheduleinsert(CalVO vo, HttpSession session) {
		String id = (String) session.getAttribute("id");
		vo.setUsername(id);
		String color = vo.getBackgroundColor();
		String[] array = color.split("#");
		color = array[1];
		vo.setBackgroundColor(color);
//		System.out.println(vo.toString());
		calMapper.scheduleinsert(vo);
	}

	// 전체 업데이트
	@RequestMapping("scheduleupdate")
	@ResponseBody
	public void scheduleupdate(CalVO vo) {
//		System.out.println("컨트롤러");
		String color = vo.getBackgroundColor();
		String[] array = color.split("#");
		color = array[1];
		vo.setBackgroundColor(color);
//		System.out.println(vo);
		calMapper.scheduleupdate(vo);
	}

	// 시간, 날짜 업데이트
	@RequestMapping("dragupdate")
	@ResponseBody
	public void dragupdate(CalVO vo) {
		System.out.println(vo);
		calMapper.dragupdate(vo);
	}

	// 일정 삭제
	@RequestMapping("scheduledelete")
	@ResponseBody
	public void scheduledelete(int calno) {

		calMapper.scheduledelete(calno);
	}
}
