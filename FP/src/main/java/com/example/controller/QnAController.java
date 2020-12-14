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
import com.example.domain.PageMaker;
import com.example.domain.QnAVO;
import com.example.mapper_oracle.QnAMapper;

@Controller
public class QnAController {
	@Autowired
	QnAMapper mapper;
	   
	// 공지사항 page로 연결한다
	@RequestMapping("QnA")
		public void QnA(){
	}
	 
	// QnA을 ajax으로 보내준다 pageing을 하기 위해
	@RequestMapping("QnAList")
	@ResponseBody
	public HashMap<String , Object> QnAList(int page,String query){
		HashMap<String , Object> map= new HashMap<>();
		   
		PageMaker pm = new PageMaker();
		Criteria cri = new Criteria(1,5);
		cri.setPage(page);
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(query));
		   
		map.put("pm", pm);
		map.put("qlist",mapper.qlist(query,cri));
		map.put("query",query);
		return map;
	}	
	
	//  QnA를 읽을때 작성자가 들어갔을떄는 update page로, 일반 회원이 들어갔을떄는 read page로 연결해준다
	@RequestMapping("QnA_read")
	public String QnA_read(int q_no, Model model,HttpSession session) {
		session.setAttribute("q_no", q_no);
		QnAVO qvo = mapper.qread(q_no);
			 
		model.addAttribute("qvo", qvo);
		if(qvo.getId().equals((String)session.getAttribute("id"))){
			return "QnA_update";
		}
		return "QnA_read";
	}
		
	// 공지사항을 작성하는 page로 연결해준다
	@RequestMapping("createMasterQnA")
	public String createMasterQnA(HttpSession session){
		
		// 로그인한 아이디가 관리자 아이디인지 확인한다. 
		String id = (String) session.getAttribute("id");
		if(id==null){
			System.out.println("로그인부터 해 이 자식아....");
			return "redirect:QnA";
		}else{
			if(id.equals("master")){
				return "createMasterQnA";
			}else{
				System.out.println("넌 글을 못써 친구야...");
				return "redirect:QnA";
			}
		}		
	}
		
	// 공지사항을 작성한다
	@RequestMapping(value="createMasterQnA", method=RequestMethod.POST)
	public String createMasterQnA(QnAVO vo,HttpSession session){
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		mapper.qinsert(vo);

		return "redirect:QnA";
	}
	   

	// 이벤트을 업데이트 했을 떄 실행
	@RequestMapping(value = "QnA_updatePost", method = RequestMethod.POST)
	public String QnA_updatePost(QnAVO vo, HttpSession session) {
	   mapper.qupdatepost(vo);
	   return "redirect:QnA";
	}
		
	// 게시물을 삭제할떄 실행
	@RequestMapping("QnA_delete")
	public String QnA_delete(int q_no, HttpSession session){
		mapper.qdelete(q_no);
		return "redirect:QnA";
	}
	
}
