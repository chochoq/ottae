package com.example.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.ClubVO;
import com.example.domain.CuVO;
import com.example.mapper_oracle.CbMapper;
import com.example.mapper_oracle.ClubMapper;
import com.example.mapper_oracle.CnMapper;
import com.example.mapper_oracle.CuMapper;
import com.example.service.ClubService;


@Controller
public class ClubController {
	@Autowired
	ClubMapper cMapper;
	
	@Autowired
	CnMapper cnMapper;
	
	@Autowired
	CbMapper cbMapper;
	
	@Autowired
	CuMapper cuMapper;
	
	@Resource(name="uploadPath")
	   String path;
	
	@Autowired
	ClubService service;
	
	// 동아리를 만드는 page로 연결한다.
	@RequestMapping("makeClub")
	public void makeClub(){
		
	}
	
	// 동아리를 만들어준다.
	@RequestMapping(value = "makeClubPost", method=RequestMethod.POST)
	public String insert(ClubVO vo,HttpSession session , HttpServletResponse response){
		String id = (String) session.getAttribute("id");
//		String str = vo.getC_tag();
//	    String[] array = str.split("#");
//	      
//	    //출력            
//	    for(int i=0;i<array.length;i++) {
//	    System.out.println(array[i]);
//	    }
		vo.setC_pid(id);
		service.makeClub(vo,session);
		return "redirect:/";
	}
	
	// 선택된 동아리의 club_first page로 연결해준다, session값에 c_code를 넣어준다.
	@RequestMapping("club_first")
	public String club_first(String c_code, Model model, HttpSession session){
		session.setAttribute("c_code", c_code);
		String id = (String) session.getAttribute("id");
		model.addAttribute("cnlist", cnMapper.cnlist(c_code));
		model.addAttribute("cblist", cbMapper.cblist(c_code));
		

		// 동아리 회장이라면 clubMaster 값에 1이 들어가도록 했다.
		ClubVO vo = cMapper.cread(c_code);
		if(vo.getC_pid().equals(id)){
			session.setAttribute("clubMaster", 1);
		}else{
			session.setAttribute("clubMaster", 0);
		}
	
		return "club_first";
	}
	
	// 선택된 동아리의 공지사항page로 연결해준다, session값에 c_code를 넣어준다.
	@RequestMapping("club_notice")
	public String club_notice(String c_code, Model model, HttpSession session){
		model.addAttribute("cnlist", cnMapper.cnlist(c_code));

		return "club_notice";
	}
	
	// 선택된 동아리의 자유게시판 page로 연결해준다, session값에 c_code를 넣어준다.
	@RequestMapping("club_board")
	public String club_board(String c_code, Model model, HttpSession session){
		model.addAttribute("cblist", cbMapper.cblist(c_code));

		return "club_board";
	}	
	
	// 동아리 main page로 연결한다. 
	@RequestMapping("clubMain")
	public void clubMain(){
	}
	
	// 로그인한 아이디가 가입된 동아리 명단을 가져온다
	@RequestMapping("myClub")
	@ResponseBody
	public List<ClubVO> myClub(HttpSession session){
		String id = (String) session.getAttribute("id");
		
		return cuMapper.myClub(id);	
	}
	
	// 전채 클럽 리스트를 가져온다 <<<<<<<<<<<<<<<임시>>>>>>>>>>>>>>>>>>>>
	@RequestMapping("clublist")
	@ResponseBody
	public List<ClubVO> clublist(){
		return cMapper.clubList();	
	}
	
	
	// 로그인된 아이디가 해당 동아리에 가입된 상태인지, 승인된 상태인지, 승인이 안된 상태인지 확인해준다.
	@RequestMapping("chkJoin")
	@ResponseBody
	public int chkJoin(HttpSession session){
		String id = (String) session.getAttribute("id");
		String c_code = (String) session.getAttribute("c_code");
		String chk =cuMapper.chkCu(c_code, id);
		if(chk==null){
			return 0;
		}else{
			chk = chk.trim();
			if(chk.equals("n")){
				return 1;
			}else{
				return 2;
			}
		}
	}
	
	// 가입 신청 page로 연결한다
	@RequestMapping("club_join")
	public void club_join(){
		
	}
	
	// 가입 신청 page로 연결한다
	@RequestMapping(value = "joinClub", method=RequestMethod.POST)
	public String joinClub(CuVO vo,HttpSession session){
		String id = (String) session.getAttribute("id");
		String c_code = (String) session.getAttribute("c_code");
		vo.setC_code(c_code);
		vo.setId(id);
		vo.setCu_schk('n');
		System.out.println(vo.toString());
		cuMapper.addMember(vo);
		return "redirect:club_first?c_code="+c_code;
	}	
	
}





















