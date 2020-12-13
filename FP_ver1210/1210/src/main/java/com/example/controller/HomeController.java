package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.mapper_oracle.ClubMapper;


@Controller
public class HomeController {
	@Autowired
	ClubMapper cMapper;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session,Model model) {
		
		String dest=(String) session.getAttribute("dest");
	    if(session.getAttribute("dest") !=null){   
	    	session.removeAttribute("dest");
	        return"redirect:" + dest;
	    }
	    model.addAttribute("gameList", cMapper.getGameList());
	    model.addAttribute("sportList", cMapper.getSportList());
	    model.addAttribute("studyList", cMapper.getStudyList());
	    model.addAttribute("hobbyList", cMapper.getHobbyList());
	    model.addAttribute("etcList", cMapper.getEtcList());
	    
		return "main";
	}
}
