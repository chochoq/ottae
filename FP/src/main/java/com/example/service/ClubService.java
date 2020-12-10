package com.example.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.ClubVO;
import com.example.domain.CuVO;
import com.example.mapper_oracle.CbMapper;
import com.example.mapper_oracle.ClubMapper;
import com.example.mapper_oracle.CnMapper;
import com.example.mapper_oracle.CuMapper;



@Service
public class ClubService {
	@Autowired
	CnMapper cnMapper;
	
	@Autowired
	CbMapper cbMapper;
	
	@Autowired
	ClubMapper cMapper;
	
	@Autowired
	CuMapper cuMapper;
	
	@Transactional
	public void cnDelete(int cn_no){
		cnMapper.cnrdelete(cn_no);
		cnMapper.cndelete(cn_no);
	}
	
	@Transactional
	public void cbDelete(int cb_no){
		cbMapper.cbrDelete(cb_no);
		cbMapper.cbDelete(cb_no);
	}
	
	@Transactional
	public void makeClub(ClubVO vo , HttpSession session){
		System.out.println(vo.toString());
		cMapper.insert(vo);
		CuVO cvo = new CuVO();
		cvo.setC_code(cMapper.max(vo.getC_pid()));
		cvo.setId((String) session.getAttribute("id"));
		cvo.setCu_fchk('n');
		cvo.setCu_pchk('y');
		cvo.setCu_schk('y');
		cuMapper.addMember(cvo);
	}   
}