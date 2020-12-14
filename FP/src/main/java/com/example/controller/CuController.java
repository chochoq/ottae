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

@Controller
public class CuController {
	@Autowired
	CuMapper cumapper;
	
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
	
	@RequestMapping(value="approveCu")
	@ResponseBody
	public void approveCu(CuVO vo){
		cumapper.approveCu(vo);
	}
	
	@RequestMapping(value="outCu")
	@ResponseBody
	public void outCu(HttpSession session,String c_code){
		String id = (String) session.getAttribute("id");
		CuVO vo = new CuVO();
		vo.setC_code(c_code);
		vo.setId(id);
		cumapper.outCu(vo);
	}
}
