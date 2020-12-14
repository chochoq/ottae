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
import com.example.domain.NoticeVO;
import com.example.domain.PageMaker;
import com.example.mapper_oracle.NoticeMapper;

@Controller
public class NoticeController {
   @Autowired
   NoticeMapper mapper;
   
   // 공지사항 page로 연결한다
   @RequestMapping("notice")
   public void notice(){
   }
   
   // 공지사항을 ajax으로 보내준다 pageing을 하기 위해
   @RequestMapping("noticeList")
   @ResponseBody
   public HashMap<String , Object> noticeList(int page,String query){
	   HashMap<String , Object> map= new HashMap<>();
	   
	   PageMaker pm = new PageMaker();
	   Criteria cri = new Criteria(1,5);
	   cri.setPage(page);
	   pm.setCri(cri);
	   pm.setTotalCount(mapper.totalCount(query));
	   
	   map.put("pm", pm);
	   map.put("nlist",mapper.nlist(query,cri));
	   map.put("query",query);
	   return map;
   }
   
   // 공지사항을 읽을때 작성자가 들어갔을떄는 update page로, 일반 회원이 들어갔을떄는 read page로 연결해준다
	@RequestMapping("notice_read")
	public String notice_read(int n_no, Model model,HttpSession session) {
		session.setAttribute("n_no", n_no);
		NoticeVO nvo = mapper.nread(n_no);
		 
		model.addAttribute("nvo", nvo);
		if(nvo.getId().equals((String)session.getAttribute("id"))){
			return "notice_update";
		}
		return "notice_read";
	}
	
	// 공지사항을 작성하는 page로 연결해준다
	@RequestMapping("createMasterNotice")
	public String createMasterNotice(HttpSession session){
		
		// 로그인한 아이디가 관리자 아이디인지 확인한다. 
		String id = (String) session.getAttribute("id");
		if(id==null){
			System.out.println("로그인부터 해 이 자식아....");
			return "redirect:notice";
		}else{
			if(id.equals("master")){
				return "createMasterNotice";
			}else{
				System.out.println("넌 글을 못써 친구야...");
				return "redirect:notice";
			}
		}		
	}
	
	// 공지사항을 작성한다
	@RequestMapping(value="createMasterNotice", method=RequestMethod.POST)
	public String createMasterNoticePost(NoticeVO vo,HttpSession session){
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		mapper.ninsert(vo);

		return "redirect:notice";
	}
   

	// 이벤트을 업데이트 했을 떄 실행
	@RequestMapping(value = "notice_updatePost", method = RequestMethod.POST)
	public String notice_updatePost(NoticeVO vo, HttpSession session) {
	   mapper.nupdatepost(vo);
	   return "redirect:notice";
	}
	
	// 게시물을 삭제할떄 실행
	@RequestMapping("notice_delete")
	public String notice_delete(int n_no, HttpSession session){
		mapper.ndelete(n_no);
		return "redirect:notice";
	}  
   
}