package com.example.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	// 동아리 개인정보 관리 및 회원관리 page로 연결한다.
	@RequestMapping("club_user")
	public void club_user(Model model,HttpSession session){
		String c_code = (String) session.getAttribute("c_code");
		
		// 동아리 정보를 가져온다
		model.addAttribute("cvo",cMapper.cread(c_code));
		// 동아리 회원수를 가져온다
		model.addAttribute("maincount", cuMapper.maincount(c_code));
		
		
	}
	
	// 동아리를 만드는 page로 연결한다.
	@RequestMapping("makeClub")
	public void makeClub(){
		
	}
	
	// 동아리를 만들어준다.
	@RequestMapping(value = "makeClubPost", method=RequestMethod.POST)
	public String insert(ClubVO vo,HttpSession session , HttpServletResponse response,MultipartHttpServletRequest multi)throws IllegalStateException, IOException{
		String id = (String) session.getAttribute("id");
		
		// 사진 등록
		MultipartFile file=multi.getFile("file");
	    if(!file.isEmpty()){
	    	String image=System.currentTimeMillis() + "_" + file.getOriginalFilename();
	        file.transferTo(new File(path + "/" + image));
	        vo.setC_pic(image);
	    }

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
		
		// 동아리 정보를 가져온다
		model.addAttribute("cvo",cMapper.cread(c_code));
		// 동아리 회원수를 가져온다
		model.addAttribute("maincount", cuMapper.maincount(c_code));
		// 공지사항을 4개 가져온다
		model.addAttribute("cnlist", cnMapper.first_cnlist(c_code));
		// 자유게시판 게시물을 4개 가져온다
		model.addAttribute("cblist", cbMapper.first_cblist(c_code));
		

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
		// 동아리 정보를 가져온다
		model.addAttribute("cvo",cMapper.cread(c_code));
		// 동아리 회원수를 가져온다
		model.addAttribute("maincount", cuMapper.maincount(c_code));
		return "club_notice";
	}
	
	// 선택된 동아리의 자유게시판 page로 연결해준다, session값에 c_code를 넣어준다.
	@RequestMapping("club_board")
	public String club_board(String c_code, Model model, HttpSession session){
		// 동아리 정보를 가져온다
		model.addAttribute("cvo",cMapper.cread(c_code));
		// 동아리 회원수를 가져온다
		model.addAttribute("maincount", cuMapper.maincount(c_code));
		return "club_board";
	}	

//	// 로그인한 아이디가 가입된 동아리 명단을 가져온다
//	@RequestMapping("myClub")
//	@ResponseBody
//	public List<ClubVO> myClub(HttpSession session){
//		String id = (String) session.getAttribute("id");
//		
//		return cuMapper.myClub(id);	
//	}

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
	@RequestMapping(value = "joinClub", method=RequestMethod.POST)
	public String joinClub(CuVO vo,HttpSession session){
		String id = (String) session.getAttribute("id");
		String c_code = (String) session.getAttribute("c_code");
		vo.setC_code(c_code);
		vo.setId(id);
		vo.setCu_schk('n');
		cuMapper.addMember(vo);
		return "redirect:club_first?c_code="+c_code;
	}
	
	
	
	
	// 동아리 관리 page로 연결한다. 
	@RequestMapping("updateClub")
	public void updateClub(HttpSession session,Model model){
		String c_code = (String) session.getAttribute("c_code");
		
		model.addAttribute("vo", cMapper.cread(c_code));
	}
	
	// 동아리를 수정한다 
	@RequestMapping(value = "updateClubPost", method = RequestMethod.POST)
	public String updateClubPost(ClubVO vo,HttpSession session,MultipartHttpServletRequest multi)throws IllegalStateException, IOException{
		String c_code = (String) session.getAttribute("c_code");

		// 사진 삭제 부분
		ClubVO oldvo = cMapper.cread(c_code);
		new File(path + "/" + oldvo.getC_pic()).delete();
		
		// 사진 등록
		MultipartFile file=multi.getFile("file");
		if(!file.isEmpty()){
		   	String image=System.currentTimeMillis() + "_" + file.getOriginalFilename();
		    file.transferTo(new File(path + "/" + image));
		    vo.setC_pic(image);
		}
		vo.setC_code(c_code);
		
		cMapper.updateClub(vo);
		
		return "redirect:club_first?c_code="+c_code;
	}
	
	
	
}





















