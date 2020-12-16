package com.example.controller;

import java.io.File;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.UserVO;
import com.example.mapper_oracle.MasterMapper;
import com.example.mapper_oracle.MypageMapper;
import com.example.service.MasterService;

@Controller
public class MasterController {
	@Resource(name = "uploadPath")
	String path;
	@Autowired
	MasterMapper mapper;
	@Autowired
	MypageMapper mymapper;
	@Autowired
	MasterService sercice;
	
	// 관리자 user관리 page에 연결
	@RequestMapping("master_userManage")
	public void master_userManage(){}
	
	// user list를 가져온다_ 검색기능까지 포함
	@RequestMapping("mulist")
	@ResponseBody
	public HashMap<String, Object> mulist(int page, Criteria cri){
		HashMap<String, Object> map = new HashMap<>();
		PageMaker pm = new PageMaker();
		cri.setPage(page);
		pm.setCri(cri);
		pm.setTotalCount(mapper.mutotalCount(cri));
		
		map.put("pm", pm);
		map.put("mulist", mapper.mulist(cri));
		return map;
	}
	// user를 삭제한다.
	@RequestMapping(value = "user_sel_delete", method = RequestMethod.POST)
	@ResponseBody
	public void user_sel_delete(String id){
		// 사진 삭제 부분
		UserVO oldvo = mymapper.myinfo(id);
		new File(path + "/" + oldvo.getImage()).delete();
		
		// user를 삭제한다.
		sercice.mudelete(id);
	}
	
	
	
	// 관리자 club관리 page에 연결
	@RequestMapping("master_clubManage")
	public void master_clubManage() { }
	
	// club list를 가져온다_ 검색기능까지 포함
	@RequestMapping("mclist")
	@ResponseBody
	public HashMap<String, Object> mclist(int page, Criteria cri){
		HashMap<String, Object> map = new HashMap<>();
		PageMaker pm = new PageMaker();
		cri.setPage(page);
		pm.setCri(cri);
		pm.setTotalCount(mapper.mctotalCount(cri));
		
		map.put("pm", pm);
		map.put("mclist", mapper.mclist(cri));
		return map;
	}
	
	// club을 삭제한다.
	@RequestMapping(value = "club_sel_delete",  method = RequestMethod.POST)
	@ResponseBody
	public void club_sel_delete(String c_code){
		sercice.mcdelete(c_code);
	}
	

	// 관리자 group관리 page에 연결
	@RequestMapping("master_groupManage")
	public void master_groupManage() { }
	
	// group list를 가져온다_ 검색기능까지 포함
	@RequestMapping("mglist")
	@ResponseBody
	public HashMap<String, Object> mglist(int page, Criteria cri){
		HashMap<String, Object> map = new HashMap<>();
		PageMaker pm = new PageMaker();
		cri.setPage(page);
		pm.setCri(cri);
		pm.setTotalCount(mapper.mgtotalCount(cri));
		
		map.put("pm", pm);
		map.put("mglist", mapper.mglist(cri));
		return map;
	}
	
	// club을 삭제한다.
	@RequestMapping(value = "group_sel_delete", method = RequestMethod.POST)
	@ResponseBody
	public void group_sel_delete(int g_code){
		sercice.mgdelete(g_code);
	}

	
}
