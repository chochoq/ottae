package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper_oracle.MasterMapper;

@Controller
public class MasterController {
	@Autowired
	MasterMapper mapper;
	
	@RequestMapping("master_userManage")
	public void master_userManage(){
		
	}
	
	@RequestMapping("mulist")
	@ResponseBody
	public HashMap<String, Object> master_userManage(int page, Criteria cri){
		HashMap<String, Object> map = new HashMap<>();
		PageMaker pm = new PageMaker();
		cri.setPage(page);
		System.out.println(cri.toString());
		pm.setCri(cri);
		pm.setTotalCount(mapper.mutotalCount(cri));
		System.out.println(pm.toString());
		
		map.put("pm", pm);
		map.put("mulist", mapper.mulist(cri));
		System.out.println(map.toString());
		return map;
	}
	@RequestMapping("master_clubManage")
	public void master_clubManage() {
	}

	@RequestMapping("master_groupManage")
	public void master_groupManage() {
	}

	
}
