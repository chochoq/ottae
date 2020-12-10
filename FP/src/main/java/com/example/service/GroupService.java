package com.example.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.GroupVO;
import com.example.domain.GuVO;
import com.example.mapper_oracle.GroupMapper;
import com.example.mapper_oracle.GuMapper;



@Service
public class GroupService {
	@Autowired
	GroupMapper mapper;
	@Autowired
	GuMapper gMapper;
	   
	@Transactional
	public void makeGroup(GroupVO vo, GuVO gvo , HttpSession session){
	   mapper.makeGroup(vo);
	  // System.out.println(gMapper.max());
	   gvo.setG_code(gMapper.max());
	   gvo.setId((String) session.getAttribute("id"));
	   gvo.setGu_pwchk("Y");
	   gMapper.addMember(gvo);
	}   
}