package com.example.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.CbVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper_oracle.CbMapper;
import com.example.mapper_oracle.ClubMapper;
import com.example.mapper_oracle.CuMapper;
import com.example.service.ClubService;

@Controller
public class CbController {
	@Autowired
	ClubMapper cMapper;
	@Autowired
	CuMapper cuMapper;
	@Autowired
	CbMapper mapper;
	@Autowired
	ClubService service;
	
	// 동아리 자유게시판 list를 보내준다. 
   	@RequestMapping("boardPageList")
	@ResponseBody
	public HashMap<String , Object> boardPageList(int page, HttpSession session){
   		HashMap<String , Object> map= new HashMap<>();
   		
   		PageMaker pm = new PageMaker();
		Criteria cri = new Criteria();
		cri.setPage(page);
		pm.setCri(cri);
		pm.setTotalCount(mapper.total((String) session.getAttribute("c_code")));
		  
		cri.setC_code((String) session.getAttribute("c_code"));
		
		map.put("pm", pm);
		map.put("vo",mapper.list_cblist(cri));
   		
   		return map;
   	}
	
	
	
	
	
	// 동아리 자유게시판 게시물 입력 page와 연결시켜준다. 
	@RequestMapping("createBoard")
	public void createboard(Model model,HttpSession session){
		String c_code = (String) session.getAttribute("c_code");
		// 동아리 정보를 가져온다
		model.addAttribute("cvo",cMapper.cread(c_code));
		// 동아리 회원수를 가져온다
		model.addAttribute("maincount", cuMapper.maincount(c_code));
	}
	
	// 동아리 게시물을 생성
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
		String c_code = (String) session.getAttribute("c_code");
		// 동아리 정보를 가져온다
		model.addAttribute("cvo",cMapper.cread(c_code));
		// 동아리 회원수를 가져온다
		model.addAttribute("maincount", cuMapper.maincount(c_code));
		
		
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
