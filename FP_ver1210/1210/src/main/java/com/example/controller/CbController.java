package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.CbVO;
import com.example.mapper_oracle.CbMapper;
import com.example.service.ClubService;

@Controller
public class CbController {
	@Autowired
	CbMapper mapper;
	@Autowired
	ClubService service;
	
	// 동아리 공지사항 입력 page와 연결시켜준다. 
	@RequestMapping("createBoard")
	public void createboard(){
		
	}
	
	// 동아리 공지사항을 생성
	@RequestMapping(value="createBoard",method=RequestMethod.POST)
	public String createBoardget(CbVO vo, HttpSession session){
		vo.setId((String) session.getAttribute("id"));
		vo.setC_code((String) session.getAttribute("c_code"));
		mapper.cbInsert(vo);	
		return "redirect:club_board?c_code="+vo.getC_code();
	}
	
	// 자유게시판을 읽을때 작성자가 들어갔을떄는 update page로, 일반 회원이 들어갔을떄는 read page로 연결해준다
	@RequestMapping("cbRead")
	public String cbRead(int cb_no, Model model,HttpSession session) {
		session.setAttribute("cb_no", cb_no); // 댓글기능떄도 사용할 cb_no를 여기서 session에 넣어준다. 
		CbVO cbVO = mapper.cbread(cb_no);
		model.addAttribute("cbvo", cbVO);
		if(cbVO.getId().equals((String)session.getAttribute("id"))){
			return "cbUpdate";
		}
		return "cbRead";
	}
	
	// 게시물을 업데이트 했을 떄 실행
	@RequestMapping(value = "cbUpdatePost", method = RequestMethod.POST)
	public String cbUpdatepost(CbVO vo, HttpSession session) {
		vo.setId((String) session.getAttribute("id"));
		vo.setC_code((String) session.getAttribute("c_code"));
	    mapper.cbUpdatepost(vo);
	    return "redirect:club_board?c_code="+vo.getC_code();
	}
	
	// 게시물을 삭제할떄 실행
	@RequestMapping("cbDelete")
	public String cndelete(int cb_no, HttpSession session){
		service.cbDelete(cb_no);
		String c_code = (String) session.getAttribute("c_code");
		return "redirect:club_board?c_code="+c_code;
	}
	     

}
