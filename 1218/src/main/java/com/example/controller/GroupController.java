package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.GroupVO;
import com.example.domain.GuVO;
import com.example.domain.UserVO;
import com.example.mapper_oracle.GroupMapper;
import com.example.mapper_oracle.GuMapper;
import com.example.mapper_oracle.UserMapper;
import com.example.service.GroupService;

@Controller
public class GroupController {
	
	@Resource(name="uploadPath")
	String path;
	
	@Autowired
	UserMapper uMapper;
	
	@Autowired
	GroupMapper gMapper;
	
	@Autowired
	GuMapper guMapper;
	
	@Autowired
	GroupService service;
	
	// group 첫 page에 연결한다.
	@RequestMapping("group")
	public void group(){}
	
	// group에 포함된 사람들을 불러온다.
	@RequestMapping("guget")
	@ResponseBody
	public List<UserVO> guget(GroupVO vo){
		return gMapper.guget(vo);
	}
	
	// id값을 가지고 내가 포함된 group명단을 가져온다
	@RequestMapping("myGroup")
	@ResponseBody
	public List<GuVO> mygroup(HttpSession session){
		
		String id = (String) session.getAttribute("id");
		return gMapper.mygroup(id);	
	}
	
	// group 만들기
	@RequestMapping("makeGroup")
	public void makeGroup(){}
	
	
	@RequestMapping(value = "makeGroupPost", method = RequestMethod.POST)
	public String makeGroupPost(GroupVO vo, GuVO gvo, HttpSession session, MultipartHttpServletRequest multi) throws IllegalStateException, IOException{
		MultipartFile file=multi.getFile("file");
	    if(!file.isEmpty()){
	    	String image=System.currentTimeMillis() + "_" + file.getOriginalFilename();
	        file.transferTo(new File(path + "/" + image));
	        vo.setG_pic(image);
	    }
	    // 그룹을 만들면 그 그룹을 만든 계정(id)는 그 그룹의 포함되도록 두가지 작업을 동시에 진행해준다. 
	    service.makeGroup(vo, gvo, session);
	    return "redirect:/";
	}
	
	
	
	@RequestMapping("addMembers")
	@ResponseBody
	public void addMembers(GuVO gvo){
		guMapper.addMember(gvo);
	}
	
	// 선택된 그룹code에 가입된 명단을 가져온다
	@RequestMapping("searchGroupMember")
	@ResponseBody
	public List<UserVO> list(String query){
		return uMapper.list(query);
	}
	

	
}
