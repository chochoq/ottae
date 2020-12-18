package com.example.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.CbrVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper_oracle.CbrMapper;

@RestController
public class CbrController {
   @Autowired
   CbrMapper cbrmapper;
   
   // 댓글 추가하는 기능
   @RequestMapping(value="insertCbReply",method=RequestMethod.POST)
   public void insertCbReply(String reply,HttpSession session){
      String id = (String) session.getAttribute("id");
      String c_code = (String) session.getAttribute("c_code");
      int cb_no = (Integer) session.getAttribute("cb_no");
      CbrVO vo = new CbrVO();
      vo.setId(id);
      vo.setC_code(c_code);
      vo.setCb_no(cb_no);
      vo.setCbr_content(reply);
      cbrmapper.insertCbr(vo);
   }
   
   // 댓글 list 가져오기
   @RequestMapping(value="getCbReply")
   public HashMap<String , Object> getCbReply(int page,HttpSession session){
      HashMap<String , Object> map= new HashMap<>();
      int cb_no = (Integer) session.getAttribute("cb_no");

      PageMaker pm = new PageMaker();
      Criteria cri = new Criteria(1,5);
      cri.setPage(page);
      pm.setCri(cri);
      pm.setTotalCount(cbrmapper.totalCount(cb_no));
      
      map.put("pm", pm);
      map.put("list", cbrmapper.ListCbr(cb_no , cri));
      
      return map;
   }
   
   // 댓글 삭제하는 기능
   @RequestMapping(value="cbrDelete")
   public void cbrDelete(int cbr_no,HttpSession session){
      cbrmapper.cbrDelete(cbr_no);
   }
}
