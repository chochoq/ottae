package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.CnVO;
import com.example.mapper_oracle.CnMapper;
import com.example.service.ClubService;

@Controller
public class CnController {
   
   @Autowired
   CnMapper mapper;
   @Autowired
   ClubService service;
   
   // 공지사항을 읽을때 작성자(동아리 회장)가 들어갔을떄는 update page로, 일반 회원이 들어갔을떄는 read page로 연결해준다
   @RequestMapping("cnRead")
	public String cnRead(int cn_no, Model model,HttpSession session) {
	   session.setAttribute("cn_no", cn_no);
	   CnVO cnVO = mapper.cnread(cn_no);
	   System.out.println(cnVO.toString());
	   
	   model.addAttribute("cnvo", cnVO);
	   if(cnVO.getId().equals((String)session.getAttribute("id"))){
		   return "cnUpdate";
	   }
	   return "cnRead";
	}
   
   // 동아리 공지사항 입력 page와 연결시켜준다. 
   @RequestMapping("createNotice")
   public void createNotice(HttpSession session){
      
   }
   
// 동아리 공지사항을 생성
   @RequestMapping(value="createNotice",method=RequestMethod.POST)
   public String createNoticeget(CnVO vo, HttpSession session){
      vo.setId((String) session.getAttribute("id"));
      vo.setC_code((String) session.getAttribute("c_code"));
      if(vo.getCn_bold() == 1){  // 중요하다는 뜻이 1인가요??
         vo.setCn_bold(1);
      }else {
         vo.setCn_bold(0);
      }
      if(vo.getCn_rchk() == 1){
         vo.setCn_rchk(1);
      }else {
         vo.setCn_rchk(0);
      }      
      mapper.cninsert(vo);   
      return "redirect:club_notice?c_code="+vo.getC_code();
   }
   
// 게시물을 업데이트 했을 떄 실행
   @RequestMapping(value = "cnUpdatePost", method = RequestMethod.POST)
   public String cnUpdatepost(CnVO vo, HttpSession session) {
      vo.setId((String) session.getAttribute("id"));
      vo.setC_code((String) session.getAttribute("c_code"));
      mapper.cnupdatepost(vo);
      return "redirect:club_notice?c_code="+vo.getC_code();
   }
	
// 게시물을 삭제할떄 실행
	@RequestMapping("cnDelete")
	public String cndelete(int cn_no, HttpSession session){
		service.cnDelete(cn_no);
		String c_code = (String) session.getAttribute("c_code");
		return "redirect:club_notice?c_code="+c_code;
	}
}