package com.example.service;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.ClubVO;
import com.example.domain.GroupVO;
import com.example.domain.GuVO;
import com.example.mapper_oracle.GroupMapper;
import com.example.mapper_oracle.GuMapper;

@Service
public class GroupService {
	@Resource(name = "uploadPath")
	String path;

	
	@Autowired
	GroupMapper mapper;
	@Autowired
	GuMapper gMapper;

	@Transactional
	public void makeGroup(GroupVO vo, GuVO gvo, HttpSession session) {
		mapper.makeGroup(vo);
		gvo.setG_code(gMapper.max());
		gvo.setId((String) session.getAttribute("id"));
		gvo.setGu_pwchk("Y");
		gMapper.addMember(gvo);
	}

	// 마스터 그룹 삭제
	@Transactional
	public void deletegroup(String id) {
		// 몇개의 group에 가입했는지를 확인한다.
		int cntgroup = gMapper.countgroup(id);

		// 가입한 group 수만큼 반복시킨다.
		for (int i = 0; i < cntgroup; i++) {
			// 가입한 group들의 g_code를 가져온다
			int g_code = gMapper.searchgcode(id);

			// group user가 몇명인지 확인하고 1명 초과일 경우 해당 유저만 삭제하고, 1명일경우 group을 같이
			// 삭제한다.
			if (gMapper.countgu(g_code) > 1) {
				gMapper.deleteMember(id, g_code);
			} else if (gMapper.countgu(g_code) == 1) {
				gMapper.deleteMember(id, g_code);
				mapper.deletegroup(g_code);
			}
		}
	}

	// 마스터 그룹 g_code로 삭제
	@Transactional
	public void deletegroupG_code(int g_code) {
		gMapper.deleteMemberG_code(g_code);
		mapper.deletegroup(g_code);
	}

	// 마스터 그룹 삭제, 마이페이지 그룹 삭제에서 사용
	@Transactional
	public void deletemygroup(String id, int g_code) {
		// group user가 몇명인지 확인하고 1명 초과일 경우 해당 유저만 삭제하고, 1명일경우 group을 같이 삭제한다.
		if (gMapper.countgu(g_code) > 1) {
			gMapper.deleteMember(id, g_code);
		} else if (gMapper.countgu(g_code) == 1) {
			gMapper.deleteMember(id, g_code);
			
			// 사진 삭제 부분
			GroupVO oldvo = mapper.gread(g_code);
			new File(path + "/" + oldvo.getG_pic()).delete();
			
			mapper.deletegroup(g_code);
		}

	}
}