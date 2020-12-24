package com.example.service;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.ClubVO;
import com.example.domain.CuVO;
import com.example.mapper_oracle.CbMapper;
import com.example.mapper_oracle.CbrMapper;
import com.example.mapper_oracle.ClubMapper;
import com.example.mapper_oracle.CnMapper;
import com.example.mapper_oracle.CnrMapper;
import com.example.mapper_oracle.CuMapper;

@Service
public class ClubService {
	@Resource(name = "uploadPath")
	String path;
	
	@Autowired
	CnMapper cnMapper;

	@Autowired
	CnrMapper cnrMapper;

	@Autowired
	CbrMapper cbrMapper;

	@Autowired
	CbMapper cbMapper;

	@Autowired
	ClubMapper cMapper;

	@Autowired
	CuMapper cuMapper;

	@Autowired
	ClubMapper mapper;

	// 동아리 공지사항 게시물을 삭제한다.이때 해당 게시물에 댓글까지 삭제한다.
	@Transactional
	public void cnDelete(int cn_no) {
		cnMapper.cnrdelete(cn_no);
		cnMapper.cndelete(cn_no);
	}

	// 동아리 자유게시판 게시물을 삭제한다.이때 해당 게시물에 댓글까지 삭제한다.
	@Transactional
	public void cbDelete(int cb_no) {
		cbMapper.cbrDelete(cb_no);
		cbMapper.cbDelete(cb_no);
	}

	// 동아리를 만든다 이떄 cu table에 만든 사람까지 추가한다
	@Transactional
	public void makeClub(ClubVO vo, HttpSession session) {
		cMapper.insert(vo);
		CuVO cvo = new CuVO();
		cvo.setC_code(cMapper.max(vo.getC_pid()));
		cvo.setId((String) session.getAttribute("id"));
		cvo.setCu_fchk('n');
		cvo.setCu_pchk('y');
		cvo.setCu_schk('y');
		cuMapper.addMember(cvo);
	}

	// 마스터_회원 삭제할 시 사용되는 동아리 삭제 id만 사용
	@Transactional
	public void deleteClub(String id) {
		int countcuid = cuMapper.countcuid(id);
		for (int i = 0; i < countcuid; i++) {
			String c_code = cuMapper.searchmax(id);
			if (!c_code.equals(null)) {

				int pid = cuMapper.searchpid(id, c_code);
				if (pid == 0) {
					cbrMapper.deletecbr(id);
					cbMapper.deletecb(id);

					cnrMapper.deletecnr(id);
					cnMapper.deletecn(id);

					cuMapper.deletecu(id);
				} else {
					String c_code1 = mapper.selectclub(id, c_code);

					cbrMapper.deletepcbr(c_code1);
					cbMapper.deletepcb(c_code1);

					cnrMapper.deletepcnr(c_code1);
					cnMapper.deletepcn(c_code1);

					cuMapper.deletepcu(c_code1);
					mapper.deleteclub(c_code1);
				}
			} else {

			}
		}
	}

	// 마스터_동아리관리에서 동아리 c_code로 삭제
	@Transactional
	public void deleteClubC_code(String c_code) {
		cbrMapper.deletepcbr(c_code);
		cbMapper.deletepcb(c_code);

		cnrMapper.deletepcnr(c_code);
		cnMapper.deletepcn(c_code);

		cuMapper.deletepcu(c_code);
		mapper.deleteclub(c_code);
	}

	// 마이페이지_동아리 삭제_id,c_code 사용
	@Transactional
	public void deletemyClub(String id, String c_code) {
		int pid = cuMapper.searchpid(id, c_code);
		if (pid == 0) {
			cbrMapper.deletemycbr(id,c_code);
			cbMapper.deletemycb(id, c_code);

			cnrMapper.deletemycnr(id, c_code);
			cnMapper.deletemycn(id, c_code);

			cuMapper.deletemycu(id, c_code);
		} else {
			String c_code1 = mapper.selectclub(id, c_code);

			cbrMapper.deletepcbr(c_code1);
			cbMapper.deletepcb(c_code1);

			cnrMapper.deletepcnr(c_code1);
			cnMapper.deletepcn(c_code1);

			cuMapper.deletepcu(c_code1);
			
			// 사진 삭제 부분
			ClubVO oldvo = mapper.cread(c_code1);
			new File(path + "/" + oldvo.getC_pic()).delete();

			mapper.deleteclub(c_code1);
		}
	}
	
	
	//동아리 회원 1명만 삭제한다. 
	@Transactional
	public void deleteClubUser(String id, String c_code) {
		cbrMapper.deletemycbr(id,c_code);
		cbMapper.deletemycb(id, c_code);

		cnrMapper.deletemycnr(id, c_code);
		cnMapper.deletemycn(id, c_code);

		cuMapper.deletemycu(id, c_code);
	}
}









