package com.example.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.CnrVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper_oracle.CnrMapper;

@RestController
public class CnrController {
   @Autowired
   CnrMapper cnrmapper;
   
   // 댓글 추가하는 기능
   @RequestMapping(value="insertCnReply",method=RequestMethod.POST)
   public void insertCnReply(String reply,HttpSession session){
      String id = (String) session.getAttribute("id");
      String c_code = (String) session.getAttribute("c_code");
      int cn_no = (Integer) session.getAttribute("cn_no");
      CnrVO vo = new CnrVO();
      vo.setId(id);
      vo.setC_code(c_code);
      vo.setCn_no(cn_no);
      vo.setCnr_content(reply);
      cnrmapper.insertCnr(vo);
   }
   
   // 댓글 list 가져오기
   @RequestMapping(value="getCnReply")
   public HashMap<String , Object> getCnReply(int page,HttpSession session){
	   System.out.println("확인");
      HashMap<String,Object> map= new HashMap<>();
      int cn_no = (Integer) session.getAttribute("cn_no");

      PageMaker pm = new PageMaker();
      Criteria cri = new Criteria(1,5);
      cri.setPage(page);
      pm.setCri(cri);
      pm.setTotalCount(cnrmapper.totalCount(cn_no));
      
      map.put("pm", pm);
      map.put("list", cnrmapper.ListCnr(cn_no , cri));
      
      return map;
   }
   
   // 댓글 삭제하는 기능
   @RequestMapping(value="cnrDelete")
   public void cnrDelete(int cnr_no,HttpSession session){
      cnrmapper.cnrDelete(cnr_no);
   }
}
