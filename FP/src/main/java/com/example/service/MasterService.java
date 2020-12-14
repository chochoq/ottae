package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mapper_oracle.CalMapper;
import com.example.mapper_oracle.CbMapper;
import com.example.mapper_oracle.CbrMapper;
import com.example.mapper_oracle.ClubMapper;
import com.example.mapper_oracle.CnMapper;
import com.example.mapper_oracle.CnrMapper;
import com.example.mapper_oracle.CuMapper;
import com.example.mapper_oracle.GroupMapper;
import com.example.mapper_oracle.GuMapper;
import com.example.mapper_oracle.MasterMapper;

@Service
public class MasterService {
	   @Autowired
	   MasterMapper mapper;
	   
	   @Autowired
	   CalMapper calmapper;
	   
	   @Autowired
	   ClubMapper clubmapper;
	   
	   @Autowired
	   CuMapper cumapper;
	   
	   @Autowired
	   CnMapper cnmapper;
	   
	   @Autowired
	   CnrMapper cnrmapper;
	   
	   @Autowired
	   CbMapper cbmapper;
	   
	   @Autowired
	   CbrMapper cbrmapper;
	   
	   @Autowired
	   GroupMapper gmapper;
	   
	   @Autowired
	   GuMapper gumapper;
	   
	   @Autowired
	   GroupService gservice;
	   
	   @Autowired
	   ClubService cservice;
	   
	   @Transactional
	   public void mudelete(String id){
	      calmapper.deleteCal(id);
	      
	      gservice.deletegroup(id);
	      
	      cservice.deleteClub(id);
	      
	      mapper.mudelete(id);
	   }
	   
	   @Transactional
	   public void mcdelete(String c_code){
	      cservice.deleteClubC_code(c_code);
	   }
	   
	   @Transactional
	   public void mgdelete(int g_code){ 
	      gservice.deletegroupG_code(g_code);
	   }
	   
	   
	   
	   

}
