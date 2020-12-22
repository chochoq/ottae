package com.example.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.CuVO;
import com.example.domain.PageMaker;
import com.example.mapper_oracle.CuMapper;
import com.example.service.ClubService;

@Controller
public class CuController {
	@Autowired
	CuMapper cumapper;
	@Autowired
	ClubService service;
	
	// 동아리 유저를 가져온다. 
	@RequestMapping(value="getClupUser")
	@ResponseBody
	public HashMap<String , Object> getClupUser(HttpSession session, int page){
		String c_code = (String) session.getAttribute("c_code");
		
		HashMap<String , Object> map= new HashMap<>();
		
		PageMaker pm = new PageMaker();
		Criteria cri = new Criteria(1,5);
		cri.setPage(page);
		pm.setCri(cri);
		pm.setTotalCount(cumapper.totalCountAll(c_code));

		map.put("pm", pm);
	    map.put("allCulist", cumapper.allCulist(c_code , cri));
		
	    return map;
		
	}
	
	
	// 승인 대기 명단을 가져온다
	@RequestMapping(value="waitCulist")
	@ResponseBody
	public HashMap<String , Object> waitCulist(CuVO vo, int page){
		HashMap<String , Object> map= new HashMap<>();
		
		PageMaker pm = new PageMaker();
		Criteria cri = new Criteria();
		cri.setPage(page);
		pm.setCri(cri);
		pm.setTotalCount(cumapper.totalCount(vo.getC_code()));

		map.put("pm", pm);
	    map.put("wCulist", cumapper.wCulist(vo.getC_code() , cri));
		
	    return map;
	}
	
	// 신청인원을 승인해준다 
	@RequestMapping(value="approveCu")
	@ResponseBody
	public void approveCu(CuVO vo){
		cumapper.approveCu(vo);
	}
	
	
	// 특정 동아리에서 탈퇴한다. .
	@RequestMapping(value="outCu")
	@ResponseBody
	public void outCu(HttpSession session,String c_code){
		String id = (String) session.getAttribute("id");
		CuVO vo = new CuVO();
		vo.setC_code(c_code);
		vo.setId(id);
		cumapper.outCu(vo);
	}
	
	// 특정 user를 동아리에서 탈퇴시킨다.
	@RequestMapping(value="deleteCu")
	@ResponseBody
	public void deleteCu(HttpSession session,String id){
		String c_code = (String) session.getAttribute("c_code");
		
		service.deleteClubUser(id,c_code);
	}
}
