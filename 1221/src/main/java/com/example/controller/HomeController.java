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
import com.example.domain.PageMaker;
import com.example.mapper_oracle.ClubMapper;
import com.example.mapper_oracle.CuMapper;


@Controller
public class HomeController {
	@Autowired
	ClubMapper cMapper;
	
	@Autowired
	CuMapper cuMapper;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session,Model model) {

		if(session.getAttribute("id") !=null){  
			String dest=(String) session.getAttribute("dest");
		    if(session.getAttribute("dest") !=null){   
		    	session.removeAttribute("dest");
		        return"redirect:" + dest;
		    }
		    model.addAttribute("myList", cuMapper.myClub((String) session.getAttribute("id")));
	    }
			
	    model.addAttribute("gameList", cMapper.getGameList());
	    model.addAttribute("sportList", cMapper.getSportList());
	    model.addAttribute("studyList", cMapper.getStudyList());
	    model.addAttribute("hobbyList", cMapper.getHobbyList());
	    model.addAttribute("etcList", cMapper.getEtcList());
	    
		return "main";
	}
	
	
	// 내가 가입한 동아리 list를 보내준다._ 검색기능 포함
	@RequestMapping("readClub")
	@ResponseBody
	public HashMap<String, Object> myclist(String c_code) {
		HashMap<String, Object> map = new HashMap<>();

		map.put("cvo", cMapper.cread(c_code));
		map.put("maincount", cuMapper.maincount(c_code));
		return map;
	}
	
	@RequestMapping("searchcir")
	@ResponseBody
	public HashMap<String, Object> searchcir(int page, Criteria cri){
		System.out.println(page + cri.getKeyword());
		HashMap<String, Object> map = new HashMap<>();
		PageMaker pm = new PageMaker();
	    cri.setPage(page);
	    pm.setCri(cri);
	    pm.setTotalCount(cMapper.countcir(cri));
	     
	    map.put("pm", pm);
	    map.put("searchList", cMapper.searchcir(cri));
	    
	    return map;
	}
}
