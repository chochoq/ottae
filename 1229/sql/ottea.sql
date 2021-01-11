--------------------------------------------------------
--  파일이 생성됨 - 수요일-12월-30-2020
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_CALNO
--------------------------------------------------------

CREATE SEQUENCE  "SEQ_CALNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 521 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CAL_NO
--------------------------------------------------------

CREATE SEQUENCE  "SEQ_CAL_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CBNO
--------------------------------------------------------

CREATE SEQUENCE  "SEQ_CBNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 301 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CBRNO
--------------------------------------------------------

CREATE SEQUENCE  "SEQ_CBRNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 201 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CNNO
--------------------------------------------------------

CREATE SEQUENCE  "SEQ_CNNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 621 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CNO
--------------------------------------------------------

CREATE SEQUENCE  "SEQ_CNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 643 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CNRNO
--------------------------------------------------------

CREATE SEQUENCE  "SEQ_CNRNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 501 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ENO
--------------------------------------------------------

CREATE SEQUENCE  "SEQ_ENO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_GROUP
--------------------------------------------------------

CREATE SEQUENCE  "SEQ_GROUP"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 623 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_MNO
--------------------------------------------------------

CREATE SEQUENCE  "SEQ_MNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 161 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_QNO
--------------------------------------------------------

CREATE SEQUENCE  "SEQ_QNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_UNO
--------------------------------------------------------

CREATE SEQUENCE  "SEQ_UNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 605 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table TBL_CAL
--------------------------------------------------------

CREATE TABLE "TBL_CAL"
(	"CALNO" NUMBER(*,0),
     "USERNAME" VARCHAR2(50 BYTE),
     "start" DATE,
     "end" DATE,
     "TITLE" VARCHAR2(200 BYTE),
     "description" VARCHAR2(2000 BYTE),
     "type" VARCHAR2(50 BYTE),
     "BACKGROUNDCOLOR" CHAR(6 BYTE),
	"TEXTCOLOR" CHAR(6 BYTE),
	"ALLDAY" CHAR(1 BYTE),
	"SCHK" CHAR(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_CB
--------------------------------------------------------

CREATE TABLE "TBL_CB"
(	"CB_NO" NUMBER(*,0),
     "C_CODE" VARCHAR2(50 BYTE),
     "ID" VARCHAR2(50 BYTE),
     "CB_TITLE" VARCHAR2(500 BYTE),
     "CB_REGDATE" DATE DEFAULT sysdate,
     "CB_CONTENT" VARCHAR2(200 BYTE)
) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_CBR
--------------------------------------------------------

CREATE TABLE "TBL_CBR"
(	"CBR_NO" NUMBER(*,0),
     "C_CODE" VARCHAR2(50 BYTE),
     "ID" VARCHAR2(50 BYTE),
     "CBR_REGDATE" DATE DEFAULT sysdate,
     "CBR_CONTENT" VARCHAR2(2000 BYTE),
     "CB_NO" NUMBER
) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_CIR
--------------------------------------------------------

CREATE TABLE "TBL_CIR"
(	"C_CODE" VARCHAR2(50 BYTE),
     "C_PID" VARCHAR2(50 BYTE),
     "C_WELCOME" VARCHAR2(2000 BYTE),
     "C_CONDITION" VARCHAR2(500 BYTE),
     "C_NAME" VARCHAR2(500 BYTE),
     "C_CATEGORY" VARCHAR2(500 BYTE),
     "C_TAG" VARCHAR2(500 BYTE),
     "C_PIC" VARCHAR2(2000 BYTE),
     "C_SPOT" VARCHAR2(2000 BYTE),
     "C_PCHK" CHAR(5 BYTE),
	"C_REGDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_CN
--------------------------------------------------------

CREATE TABLE "TBL_CN"
(	"CN_NO" NUMBER(*,0),
     "C_CODE" VARCHAR2(50 BYTE),
     "ID" VARCHAR2(50 BYTE),
     "CN_TITLE" VARCHAR2(500 BYTE),
     "CN_REGDATE" DATE DEFAULT sysdate,
     "CN_CONTENT" VARCHAR2(2000 BYTE),
     "CN_BOLD" NUMBER(*,0) DEFAULT 0,
     "CN_RCHK" NUMBER(*,0) DEFAULT 0
) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_CNR
--------------------------------------------------------

CREATE TABLE "TBL_CNR"
(	"CNR_NO" NUMBER(*,0),
     "C_CODE" VARCHAR2(50 BYTE),
     "CN_NO" NUMBER(*,0),
     "ID" VARCHAR2(50 BYTE),
     "CNR_REGDATE" DATE DEFAULT sysdate,
     "CNR_CONTENT" VARCHAR2(2000 BYTE)
) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_CU
--------------------------------------------------------

CREATE TABLE "TBL_CU"
(	"C_CODE" VARCHAR2(50 BYTE),
     "ID" VARCHAR2(50 BYTE),
     "CU_PCHK" CHAR(5 BYTE),
	"CU_SCHK" CHAR(5 BYTE),
	"CU_FCHK" CHAR(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_EVENT
--------------------------------------------------------

CREATE TABLE "TBL_EVENT"
(	"E_NO" NUMBER(*,0),
     "ID" VARCHAR2(50 BYTE),
     "E_TITLE" VARCHAR2(50 BYTE),
     "E_REGDATE" DATE,
     "E_CONTENT" VARCHAR2(2000 BYTE)
) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_GROUP
--------------------------------------------------------

CREATE TABLE "TBL_GROUP"
(	"G_CODE" NUMBER(*,0),
     "G_PIC" VARCHAR2(2000 BYTE),
     "G_PASS" VARCHAR2(50 BYTE),
     "G_REGDATE" DATE DEFAULT sysdate,
     "G_NAME" VARCHAR2(500 BYTE)
) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_GU
--------------------------------------------------------

CREATE TABLE "TBL_GU"
(	"ID" VARCHAR2(50 BYTE),
     "G_CODE" NUMBER(*,0),
     "GU_PWCHK" CHAR(5 BYTE)
    ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_NOTICE
--------------------------------------------------------

CREATE TABLE "TBL_NOTICE"
(	"N_NO" NUMBER(*,0),
     "ID" VARCHAR2(50 BYTE),
     "N_TITLE" VARCHAR2(50 BYTE),
     "N_REGDATE" DATE,
     "N_CONTENT" VARCHAR2(2000 BYTE)
) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_QNA
--------------------------------------------------------

CREATE TABLE "TBL_QNA"
(	"Q_NO" NUMBER(*,0),
     "ID" VARCHAR2(50 BYTE),
     "Q_REGDATE" DATE,
     "Q_TITLE" VARCHAR2(50 BYTE),
     "Q_CONTENT" VARCHAR2(2000 BYTE)
) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_USER
--------------------------------------------------------

CREATE TABLE "TBL_USER"
(	"ID" VARCHAR2(50 BYTE),
     "PW" VARCHAR2(50 BYTE),
     "NAME" VARCHAR2(15 BYTE),
     "BIRTHDAY" CHAR(10 BYTE),
	"PHONE" VARCHAR2(20 BYTE),
	"ADDR" VARCHAR2(200 BYTE),
	"ADDRDETAIL" VARCHAR2(200 BYTE),
	"EMAIL" VARCHAR2(200 BYTE),
	"GENDER" CHAR(5 BYTE),
	"U_KEYWORD" VARCHAR2(200 BYTE),
	"IMAGE" VARCHAR2(2000 BYTE),
	"UNO" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into TBL_CAL
SET DEFINE OFF;
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (402,'isk01183',to_date('202012250000:00','YYYYMMDDHH24MI:SS'),to_date('202012260000:00','YYYYMMDDHH24MI:SS'),'크리스마스',null,'개인일정','D25565','ffffff','1','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (401,'isk01183',to_date('202012230000:00','YYYYMMDDHH24MI:SS'),to_date('202012240000:00','YYYYMMDDHH24MI:SS'),'게임하기',null,'개인일정','D25565','ffffff','1','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (403,'isk01183',to_date('202012140000:00','YYYYMMDDHH24MI:SS'),to_date('202012182300:00','YYYYMMDDHH24MI:SS'),'학교가기',null,'개인일정','74c0fc','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (404,'isk01183',to_date('202012020000:00','YYYYMMDDHH24MI:SS'),to_date('202012030000:00','YYYYMMDDHH24MI:SS'),'게임하기',null,'개인일정','D25565','ffffff','1','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (405,'isk01183',to_date('202012090000:00','YYYYMMDDHH24MI:SS'),to_date('202012100000:00','YYYYMMDDHH24MI:SS'),'게임하기',null,'개인일정','D25565','ffffff','1','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (406,'isk01183',to_date('202012271015:00','YYYYMMDDHH24MI:SS'),to_date('202012291115:00','YYYYMMDDHH24MI:SS'),'공부하기',null,'개인일정','a9e34b','ffffff','0','0');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (407,'qq',to_date('202012241106:00','YYYYMMDDHH24MI:SS'),to_date('202012271206:00','YYYYMMDDHH24MI:SS'),'하루종일자기',null,'개인일정','D25565','ffffff','0','0');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (408,'qq',to_date('202012300000:00','YYYYMMDDHH24MI:SS'),to_date('202012310000:00','YYYYMMDDHH24MI:SS'),'치과방문',null,'개인일정','D25565','ffffff','1','0');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (409,'qq',to_date('202101051109:00','YYYYMMDDHH24MI:SS'),to_date('202101051209:00','YYYYMMDDHH24MI:SS'),'훈련',null,'개인일정','D25565','ffffff','0','0');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (410,'qq',to_date('202101141109:00','YYYYMMDDHH24MI:SS'),to_date('202101141209:00','YYYYMMDDHH24MI:SS'),'훈련',null,'개인일정','D25565','ffffff','0','0');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (411,'qq',to_date('202101011109:00','YYYYMMDDHH24MI:SS'),to_date('202101011209:00','YYYYMMDDHH24MI:SS'),'떡국먹기',null,'개인일정','D25565','ffffff','0','0');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (412,'qq',to_date('202101221109:00','YYYYMMDDHH24MI:SS'),to_date('202101221209:00','YYYYMMDDHH24MI:SS'),'데이트',null,'개인일정','D25565','ffffff','0','0');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (413,'qq',to_date('202101121110:00','YYYYMMDDHH24MI:SS'),to_date('202101121210:00','YYYYMMDDHH24MI:SS'),'훈련',null,'개인일정','D25565','ffffff','0','0');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (414,'qq',to_date('202101191111:00','YYYYMMDDHH24MI:SS'),to_date('202101191211:00','YYYYMMDDHH24MI:SS'),'훈련',null,'개인일정','D25565','ffffff','0','0');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (415,'sToveee',to_date('202012291130:00','YYYYMMDDHH24MI:SS'),to_date('202012291230:00','YYYYMMDDHH24MI:SS'),'코딩테스트',null,'개인일정','a9e34b','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (416,'sToveee',to_date('202101051131:00','YYYYMMDDHH24MI:SS'),to_date('202101051231:00','YYYYMMDDHH24MI:SS'),'백준문제풀기',null,'개인일정','a9e34b','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (417,'sToveee',to_date('202101121131:00','YYYYMMDDHH24MI:SS'),to_date('202101121231:00','YYYYMMDDHH24MI:SS'),'백준문제풀기',null,'개인일정','a9e34b','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (418,'sToveee',to_date('202101191131:00','YYYYMMDDHH24MI:SS'),to_date('202101191231:00','YYYYMMDDHH24MI:SS'),'백준문제풀기',null,'개인일정','a9e34b','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (419,'sToveee',to_date('202012311131:00','YYYYMMDDHH24MI:SS'),to_date('202012311231:00','YYYYMMDDHH24MI:SS'),'아이맥구입',null,'개인일정','a9e34b','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (420,'sToveee',to_date('202101151132:00','YYYYMMDDHH24MI:SS'),to_date('202101151232:00','YYYYMMDDHH24MI:SS'),'아이폰13 발표','떨지않기','개인일정','a9e34b','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (421,'sToveee',to_date('202101091132:00','YYYYMMDDHH24MI:SS'),to_date('202101091232:00','YYYYMMDDHH24MI:SS'),'스티브잡스애도하기',null,'개인일정','a9e34b','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (422,'dlwkdgml112',to_date('202012250000:00','YYYYMMDDHH24MI:SS'),to_date('202012260000:00','YYYYMMDDHH24MI:SS'),'해피 크리스마스',null,'개인일정','D25565','ffffff','1','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (423,'dlwkdgml112',to_date('202012240000:00','YYYYMMDDHH24MI:SS'),to_date('202012250000:00','YYYYMMDDHH24MI:SS'),'자소서 이력서 완성','어떻게하지

','개인일정','D25565','ffffff','1','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (424,'dlwkdgml112',to_date('202101041526:00','YYYYMMDDHH24MI:SS'),to_date('202101041626:00','YYYYMMDDHH24MI:SS'),'수료식','정들었다...','2조 프로젝트 일정 모임','ffa94d','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (425,'dlwkdgml112',to_date('202012251400:00','YYYYMMDDHH24MI:SS'),to_date('202012251654:00','YYYYMMDDHH24MI:SS'),'삼자대면',null,'개인일정','9775fa','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (426,'dlwkdgml112',to_date('202101011556:00','YYYYMMDDHH24MI:SS'),to_date('202101011656:00','YYYYMMDDHH24MI:SS'),'장보기',null,'개인일정','a9e34b','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (427,'dlrkdwns321',to_date('202012091630:00','YYYYMMDDHH24MI:SS'),to_date('202012091730:00','YYYYMMDDHH24MI:SS'),'다이어트',null,'개인일정','D25565','ffffff','0','0');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (428,'dlrkdwns321',to_date('202012181631:00','YYYYMMDDHH24MI:SS'),to_date('202012181731:00','YYYYMMDDHH24MI:SS'),'로드워크',null,'개인일정','f06595','ffffff','0','0');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (429,'dlrkdwns321',to_date('202012211631:00','YYYYMMDDHH24MI:SS'),to_date('202012211731:00','YYYYMMDDHH24MI:SS'),'하체운동',null,'개인일정','a9e34b','ffffff','0','0');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (441,'master',to_date('202012290000:00','YYYYMMDDHH24MI:SS'),to_date('202012300000:00','YYYYMMDDHH24MI:SS'),'프로젝트 발표','2조 final project 발표!!','2조 프로젝트 일정 모임','D25565','ffffff','1','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (445,'cds301',to_date('202012250000:00','YYYYMMDDHH24MI:SS'),to_date('202012260000:00','YYYYMMDDHH24MI:SS'),'데이트','크리스마스','개인일정','9775fa','ffffff','1','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (443,'master',to_date('202012250000:00','YYYYMMDDHH24MI:SS'),to_date('202012260000:00','YYYYMMDDHH24MI:SS'),'크리스마스','메리크리스마스~','2조 프로젝트 일정 모임','a9e34b','ffffff','1','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (444,'master',to_date('202012281000:00','YYYYMMDDHH24MI:SS'),to_date('202012281100:00','YYYYMMDDHH24MI:SS'),'발표 리허설','발표 리허설','2조 프로젝트 일정 모임','D25565','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (446,'cds301',to_date('202012260000:00','YYYYMMDDHH24MI:SS'),to_date('202012270000:00','YYYYMMDDHH24MI:SS'),'최종 이력서 작성','단톡방 이력서 샘플 참고','개인일정','9775fa','ffffff','1','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (447,'plove',to_date('202012301201:00','YYYYMMDDHH24MI:SS'),to_date('202101021301:00','YYYYMMDDHH24MI:SS'),'2021년 없애기',null,'개인일정','f06595','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (448,'plove',to_date('202101031201:00','YYYYMMDDHH24MI:SS'),to_date('202101031301:00','YYYYMMDDHH24MI:SS'),'원피스주간',null,'개인일정','f06595','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (449,'plove',to_date('202101101201:00','YYYYMMDDHH24MI:SS'),to_date('202101101301:00','YYYYMMDDHH24MI:SS'),'하이큐주간',null,'개인일정','f06595','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (450,'plove',to_date('202101171201:00','YYYYMMDDHH24MI:SS'),to_date('202101171301:00','YYYYMMDDHH24MI:SS'),'충사주간',null,'개인일정','f06595','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (451,'plove',to_date('202101241202:00','YYYYMMDDHH24MI:SS'),to_date('202101241302:00','YYYYMMDDHH24MI:SS'),'허니와클로버주간',null,'개인일정','f06595','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (452,'pave_LL',to_date('202101301208:00','YYYYMMDDHH24MI:SS'),to_date('202101301308:00','YYYYMMDDHH24MI:SS'),'대망의 토익시험',null,'개인일정','74c0fc','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (453,'pave_LL',to_date('202101281208:00','YYYYMMDDHH24MI:SS'),to_date('202101281308:00','YYYYMMDDHH24MI:SS'),'토익모의시험',null,'개인일정','74c0fc','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (454,'pave_LL',to_date('202101141208:00','YYYYMMDDHH24MI:SS'),to_date('202101141308:00','YYYYMMDDHH24MI:SS'),'토익모의시험',null,'개인일정','74c0fc','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (455,'pave_LL',to_date('202101061209:00','YYYYMMDDHH24MI:SS'),to_date('202101061309:00','YYYYMMDDHH24MI:SS'),'토익스터디',null,'개인일정','74c0fc','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (456,'pave_LL',to_date('202101201209:00','YYYYMMDDHH24MI:SS'),to_date('202101201309:00','YYYYMMDDHH24MI:SS'),'토익스터디',null,'개인일정','74c0fc','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (457,'lalaUlalaU',to_date('202012301214:00','YYYYMMDDHH24MI:SS'),to_date('202012301314:00','YYYYMMDDHH24MI:SS'),'유투브촬영',null,'개인일정','a9e34b','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (458,'lalaUlalaU',to_date('202101271214:00','YYYYMMDDHH24MI:SS'),to_date('202101271314:00','YYYYMMDDHH24MI:SS'),'유투브촬영',null,'개인일정','a9e34b','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (459,'lalaUlalaU',to_date('202101071215:00','YYYYMMDDHH24MI:SS'),to_date('202101071315:00','YYYYMMDDHH24MI:SS'),'원서읽기 중간점검','스터디에서','개인일정','a9e34b','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (460,'lalaUlalaU',to_date('202101211215:00','YYYYMMDDHH24MI:SS'),to_date('202101211315:00','YYYYMMDDHH24MI:SS'),'원서읽기 최종점검',null,'개인일정','a9e34b','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (461,'no1dev',to_date('202101011229:00','YYYYMMDDHH24MI:SS'),to_date('202101011329:00','YYYYMMDDHH24MI:SS'),'떡국많이먹고 나이먹기',null,'개인일정','ffa94d','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (462,'no1dev',to_date('202101261229:00','YYYYMMDDHH24MI:SS'),to_date('202101261329:00','YYYYMMDDHH24MI:SS'),'면접',null,'개인일정','ffa94d','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (463,'Guwolo',to_date('202101131230:00','YYYYMMDDHH24MI:SS'),to_date('202101131330:00','YYYYMMDDHH24MI:SS'),'야구연습',null,'개인일정','74c0fc','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (464,'Guwolo',to_date('202101031231:00','YYYYMMDDHH24MI:SS'),to_date('202101031331:00','YYYYMMDDHH24MI:SS'),'아침운동',null,'개인일정','74c0fc','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (465,'Guwolo',to_date('202101241231:00','YYYYMMDDHH24MI:SS'),to_date('202101241331:00','YYYYMMDDHH24MI:SS'),'아침운동',null,'개인일정','74c0fc','ffffff','0','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (483,'no1dev',to_date('202012150000:00','YYYYMMDDHH24MI:SS'),to_date('202012160000:00','YYYYMMDDHH24MI:SS'),'하하하하',null,'방탈출','f06595','ffffff','1','1');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (482,'no1dev',to_date('202012090000:00','YYYYMMDDHH24MI:SS'),to_date('202012100000:00','YYYYMMDDHH24MI:SS'),'testing111','asdf','개인일정','D25565','ffffff','1','0');
Insert into TBL_CAL (CALNO,USERNAME,"start","end",TITLE,"description","type",BACKGROUNDCOLOR,TEXTCOLOR,ALLDAY,SCHK) values (484,'no1dev',to_date('202012211440:00','YYYYMMDDHH24MI:SS'),to_date('202012211540:00','YYYYMMDDHH24MI:SS'),'하이',null,'개인일정','f06595','ffffff','0','1');
REM INSERTING into TBL_CB
SET DEFINE OFF;
Insert into TBL_CB (CB_NO,C_CODE,ID,CB_TITLE,CB_REGDATE,CB_CONTENT) values (262,'520','dlwkdgml112','코붕이 인사드립니다',to_date('202012241743:19','YYYYMMDDHH24MI:SS'),'잘부탁드려요');
Insert into TBL_CB (CB_NO,C_CODE,ID,CB_TITLE,CB_REGDATE,CB_CONTENT) values (263,'520','lalaUlalaU','안녕하세요 가입했습니다',to_date('202012241743:22','YYYYMMDDHH24MI:SS'),'안녕하세요
코딩시작한지 얼마안됐어요!!!
반갑습니다!');
Insert into TBL_CB (CB_NO,C_CODE,ID,CB_TITLE,CB_REGDATE,CB_CONTENT) values (264,'520','Guwolo','버티컬마우스 어떤가요?',to_date('202012241744:36','YYYYMMDDHH24MI:SS'),'정말로 편한가요?
혹시 사용하고계신분 있으면 추천 해주세요~~');
Insert into TBL_CB (CB_NO,C_CODE,ID,CB_TITLE,CB_REGDATE,CB_CONTENT) values (265,'520','sToveee','나는 애플의 수장 팀쿡',to_date('202012241745:45','YYYYMMDDHH24MI:SS'),'한국의 개발자들 잘한다 들었다
애플 와라
환영한다
실리콘벨리 온다
');
Insert into TBL_CB (CB_NO,C_CODE,ID,CB_TITLE,CB_REGDATE,CB_CONTENT) values (266,'520','plove','img가 안나와요ㅠㅠ',to_date('202012241748:44','YYYYMMDDHH24MI:SS'),'저희가 만든 게시판에 이미지가 안나와요

역시.. 저는 안되나바요ㅠㅠ

혹시 과외해주실분...ㅜ?');
Insert into TBL_CB (CB_NO,C_CODE,ID,CB_TITLE,CB_REGDATE,CB_CONTENT) values (267,'520','pave_LL','코딩하면서 가장 많이 늘어난것은??',to_date('202012241750:36','YYYYMMDDHH24MI:SS'),'그건 바로
욕

여러분은 어떠세요??
ㅠㅠ
개발보다 욕을 더 많이하는거같아요..');
Insert into TBL_CB (CB_NO,C_CODE,ID,CB_TITLE,CB_REGDATE,CB_CONTENT) values (268,'520','lalaUlalaU','미드 혹시 보시나요?',to_date('202012241756:05','YYYYMMDDHH24MI:SS'),'빅뱅이론
실리콘벨리
it관련 미드/시트콤 추천해주세요!!

실리콘밸리 재미있어요!');
Insert into TBL_CB (CB_NO,C_CODE,ID,CB_TITLE,CB_REGDATE,CB_CONTENT) values (269,'520','no1dev','동아리 주인은 바로 나야나',to_date('202012241757:43','YYYYMMDDHH24MI:SS'),'나야나 나야나
하하
혹시 가짜개발자 프로젝트 보셨나요?

우리도 프로듀스101해서 프로젝트101하면 어때요 재미있겟다');
Insert into TBL_CB (CB_NO,C_CODE,ID,CB_TITLE,CB_REGDATE,CB_CONTENT) values (273,'520','no1dev','회원수 9명 꺄오',to_date('202012241905:20','YYYYMMDDHH24MI:SS'),'꺄오 우리 동아리 흥하네요
9명이예요
10명이 코앞에!!');
Insert into TBL_CB (CB_NO,C_CODE,ID,CB_TITLE,CB_REGDATE,CB_CONTENT) values (271,'520','cds301','가입인사',to_date('202012241840:49','YYYYMMDDHH24MI:SS'),'안녕하세요
일정 사진 수정한 기념으로 가입합니다
잘 부탁드립니다!');
Insert into TBL_CB (CB_NO,C_CODE,ID,CB_TITLE,CB_REGDATE,CB_CONTENT) values (272,'520','no1dev','크리스마스,,래요..저의 크리스마스는',to_date('202012241904:19','YYYYMMDDHH24MI:SS'),'................역시
...

.
.
....
..
.
.
...
.
.

따뜻한 이불안에서 영화를 보는거죠
개꿀!');
Insert into TBL_CB (CB_NO,C_CODE,ID,CB_TITLE,CB_REGDATE,CB_CONTENT) values (274,'520','isk01183','코딩이 어려워요',to_date('202012242015:21','YYYYMMDDHH24MI:SS'),'함께 공부하면서 코딩하실 분있을까요?');
Insert into TBL_CB (CB_NO,C_CODE,ID,CB_TITLE,CB_REGDATE,CB_CONTENT) values (275,'520','isk01183','코딩이 어려워요',to_date('202012242015:40','YYYYMMDDHH24MI:SS'),'ㅇ');
REM INSERTING into TBL_CBR
SET DEFINE OFF;
Insert into TBL_CBR (CBR_NO,C_CODE,ID,CBR_REGDATE,CBR_CONTENT,CB_NO) values (143,'520','pave_LL',to_date('202012241751:20','YYYYMMDDHH24MI:SS'),'버티컬마우스 저도 사용하는데 좋아요!!! ',264);
Insert into TBL_CBR (CBR_NO,C_CODE,ID,CBR_REGDATE,CBR_CONTENT,CB_NO) values (144,'520','pave_LL',to_date('202012241751:50','YYYYMMDDHH24MI:SS'),'팜터레스트인가? 키보드받침대도 있으면 효과가 두배입니다!',264);
Insert into TBL_CBR (CBR_NO,C_CODE,ID,CBR_REGDATE,CBR_CONTENT,CB_NO) values (141,'520','sToveee',to_date('202012241746:00','YYYYMMDDHH24MI:SS'),'안녕 한다 반갑다 애플 와라',262);
Insert into TBL_CBR (CBR_NO,C_CODE,ID,CBR_REGDATE,CBR_CONTENT,CB_NO) values (142,'520','plove',to_date('202012241746:58','YYYYMMDDHH24MI:SS'),'어그로 ㄴㄴㄴㄴㄴ',265);
Insert into TBL_CBR (CBR_NO,C_CODE,ID,CBR_REGDATE,CBR_CONTENT,CB_NO) values (145,'520','pave_LL',to_date('202012241752:12','YYYYMMDDHH24MI:SS'),'화이팅... 여기 누군가가 대답해주실거예요',266);
Insert into TBL_CBR (CBR_NO,C_CODE,ID,CBR_REGDATE,CBR_CONTENT,CB_NO) values (146,'520','pave_LL',to_date('202012241752:25','YYYYMMDDHH24MI:SS'),'가고싶다 애플 사고싶다 애플',265);
Insert into TBL_CBR (CBR_NO,C_CODE,ID,CBR_REGDATE,CBR_CONTENT,CB_NO) values (147,'520','pave_LL',to_date('202012241752:39','YYYYMMDDHH24MI:SS'),'반갑습니다!~!!!',263);
Insert into TBL_CBR (CBR_NO,C_CODE,ID,CBR_REGDATE,CBR_CONTENT,CB_NO) values (148,'520','no1dev',to_date('202012241758:20','YYYYMMDDHH24MI:SS'),'와 팀쿡이다!!! 미천한 분이 고귀한 곳에 왔네요!!',265);
Insert into TBL_CBR (CBR_NO,C_CODE,ID,CBR_REGDATE,CBR_CONTENT,CB_NO) values (149,'520','no1dev',to_date('202012241902:58','YYYYMMDDHH24MI:SS'),'안녕하세요! 싸이버펑크를 즐겨하시는분 맞죠? 반가워요 저도 님 동아리 가입헀어요!',271);
Insert into TBL_CBR (CBR_NO,C_CODE,ID,CBR_REGDATE,CBR_CONTENT,CB_NO) values (161,'520','dlwkdgml112',to_date('202012281022:50','YYYYMMDDHH24MI:SS'),'어서옵쇼~',263);
Insert into TBL_CBR (CBR_NO,C_CODE,ID,CBR_REGDATE,CBR_CONTENT,CB_NO) values (162,'520','dlwkdgml112',to_date('202012281026:53','YYYYMMDDHH24MI:SS'),'꿀팁 알아갑니다',264);
REM INSERTING into TBL_CIR
SET DEFINE OFF;
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('443','isk01183','안녕하세요 ','x','베이킹나라 간식공주','취미','태그','1608683684233_baking-gingerbread-cookies-picjumbo-com.jpg','인천','YInfo',to_date('202012230934:47','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('449','dlwkdgml112','건강해집시다화이팅','열심히 합시다','[헬스/PT] 헬피','운동','태그','1608686911901_christmas-4672629_1920.jpg','인천','YInfo',to_date('202012231028:33','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('450','qq','봄날의 생맥을 좋아하세요?
','음주할 수 있는 19세이상만 들어오세요','생맥 with me','공부','태그','1608690321691_beer.jfif','구월동','YInfo',to_date('202012231125:25','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('463','isk01183','재밋게 만들어요','x','레몬테라스','취미','태그','1608704337274_budapest-4011923.jpg','서울','YInfo',to_date('202012231518:59','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('483','rlackdtn123','같이 자전거도 타고 열심히 하실분 구합니다','활동 잘해주실거죠?^^','자전거와 킥보드','운동','태그','1608768645833_ad80ae85f4c57189069f61a65d2ee52a_1547517195.jpg','대구','YInfo',to_date('202012240910:49','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('465','isk01183','달콤한걸 먹어요','x','스위트박스','취미','태그','1608707021327_whitney.jpg','서울','YInfo',to_date('202012231603:43','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('503','rlackdtn123','극진의 마음으로 갈고닦아 심신을 수양합시다','열심히 합시다','극진도의 마음','운동','태그','1608769546444_images.png','인천','YInfo',to_date('202012240925:48','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('504','isk01183','달콤한 간식을 같이 만들어요','x','-Snackii-','취미','태그','1608771583060_ibrahim-boran-weg93vRGgGk-unsplash.jpg','인천','YInfo',to_date('202012240959:46','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('505','isk01183','요리에 대해서 같이 연구해요','x','박정자의 쿠킹클래스','취미','태그','1608771691105_avocado-1838785.jpg','부산','YInfo',to_date('202012241001:34','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('509','isk01183','가끔씩 모여서 카메라 정보나 사진 보정 방법 팁을 공유합니다.','DSLR카메라 소유','DSLR카메라 공식동아리','기타','태그','1608773223727_camera-2598507.jpg','서울','YInfo',to_date('202012241027:07','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('510','isk01183','촬영기술과 편집기술에 대해서 공유하는 동아리입니다.','x','Photography','기타','태그','1608773482970_camera-1209256.jpg','경기','YInfo',to_date('202012241031:26','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('508','isk01183','각자 집에서 양식을 만들고 레시피를 공유해요','x','FOODMAD','취미','태그','1608772324378_ingredients-498199.jpg','집','YInfo',to_date('202012241012:08','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('511','isk01183','여행정보 공유해요','x','여행사랑','기타','태그','1608773856070_simon-migaj-Yui5vfKHuzs-unsplash.jpg','x','YInfo',to_date('202012241037:39','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('512','isk01183','일본여행의 정보를 주로 공유하고 있는 동아리입니다.','x','J_Traveler','기타','태그','1608774170083_florencia-lewis-p_6De0u7vp8-unsplash.jpg','x','YInfo',to_date('202012241042:53','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('513','isk01183','서적의 정보를 공유하고 추천해주는 동아리 입니다.','x','푸딩리딩','기타','태그','1608774287440_alfons-morales-YLSwjSy7stw-unsplash.jpg','x','YInfo',to_date('202012241044:51','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('514','isk01183','ps4 게임 정보 빛 공략을 공유합니다.','ps4 보유자','PS4의 귀한','게임','태그','1608778258735_nikita-kachanovsky-mwytIca3qNA-unsplash.jpg','x','YInfo',to_date('202012241151:02','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('515','isk01183','닌텐도 게임의 정보 및 공략을 공유하는 동아리입니다.','Nintend 보유자','오늘의 닌텐도','게임','태그','1608778412506_zekkotek-GSHSVztz3ks-unsplash.jpg','x','YInfo',to_date('202012241153:36','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('516','plove','원하는 만화책을 정해서 토론해보기','만화를 사랑하는 누구나','만화 연구소','공부','태그','1608778793158_photo-1531501410720-c8d437636169.jfif','만화 속 세상','YInfo',to_date('202012241159:55','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('517','isk01183','마인크래프트 건축물 공유 정보 교환합니다.','Minecraft 보유','마인크래프트안하는사람이있어?','게임','태그','1608779165022_1910133_218378771828430_1585347078416351660_n.jpg','x','YInfo',to_date('202012241206:08','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('518','pave_LL','열심히 활동해주세요
감사합니다!','영어공부의 열정이 있으신 분','TOEIC/EPT/IELTS','공부','태그','1608779253421_photo-1603115572850-a0dcaebef8a1.jfif','강남','YInfo',to_date('202012241207:35','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('519','lalaUlalaU','저희는 한달 간격으로 원서를 읽습니다
유투브를 확인하세요
https://youtu.be/0a34l9uKLuQ','원서를 읽을 의지가 있으신분','★원 서 읽 기☆','공부','태그','1608779662147_photo-1463320726281-696a485928c7.jfif','책을읽을수있는곳어디든','YInfo',to_date('202012241214:24','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('520','no1dev','빡코딩 같이해요!
궁금한거 언제든 물어보세요','코딩에 관심있으세요?','하드코딩하는 사람들','공부','태그','1608779940505_photo-1509966756634-9c23dd6e6815.jfif','어디든!','YInfo',to_date('202012241219:02','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('543','dlwkdgml112','보디빌더를 목표로 열심히 합시다','물보다 프로틴을 더 마실수있습니까?','보디빌더 따라잡기','운동','태그','1608802484541_hellth.jpg','인천','YInfo',to_date('202012241834:44','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('544','rlackdtn123','땀과 노력은 배신하지않습니다',null,'낙무아이','운동','태그','1608802935283_unnamed.jpg','경기도','YInfo',to_date('202012241842:15','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('545','dlrkdwns321',null,'꾸준히 오실분만','조깅하실래요?','운동','태그','1608803269602_run.jpg','대구','YInfo',to_date('202012241847:49','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('546','no1dev','안녕하세요
다양한 취미를 즐기고 싶으시다고요?
여기와서 많은 정보를 얻을수있어요!','각자의 취미를 공유해주실분','넓고얕은 취미생활','취미','태그','1608803349215_photo-1593037515490-c4d56a9ff5ff.jfif','이태원','YInfo',to_date('202012241849:11','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('547','cds301','마랭 1000 미만은 다 뉴비야!
뉴비는 환영이야!','누구나','몬스터헌터 서클','게임','태그','1608803412101_몬헌.jpg','용결정의 땅','YInfo',to_date('202012241850:16','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('548','cds301','비록 사이버펑크 2077이 망했지만
버그도 사랑하는 마음으로 정보공유 하는 동아리입니다.','기업은빠져','사이버펑크 2077 정보공유','게임','태그','1608803488770_사이버펑크.jpg','나이트시티','YInfo',to_date('202012241851:32','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('549','no1dev','over the rainbow를 같이 연주해보실래요?','우쿨렐레를 치고 싶어하시는 분 모두','우쿨렐레매니아','취미','태그','1608803538452_photo-1563994101801-7d510b52c6d9.jfif','홍대','YInfo',to_date('202012241852:20','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('550','cds301','공중콤보 장인 분들 환영합니다.','누구나환영','데메크5 단테랑 네로랑','게임','태그','1608803569074_데메크5.jpg','지옥','YInfo',to_date('202012241852:53','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('551','no1dev','나만 고양이 없어, 없다고요? 여기에 있습니다','고양이를 좋아하세요?','고양이라서 다행이야','취미','태그','1608803668185_photo-1493406300581-484b937cdc41.jfif','집','YInfo',to_date('202012241854:30','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('552','cds301','수호자여 당신이 필요합니다.
데스티니 가디언즈의 공상과학 액션 대서사시와 모든 확장판들을 데스티니 가디언즈: 전설 에디션으로 경험해 보세요. 여러분만의 수호자를 만들고 진화하는 데스티니 세계의 이야기를 즐기세요','수호자','데스티니 가디언즈 꼬꼬마클랜','게임','태그','1608803718997_데스티니.jpg','여행자','YInfo',to_date('202012241855:23','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('553','no1dev','카페인에는 취약하지만 커피는 매우 사랑하는 사람들의 모임 하루 2잔은 치사량이지만 1잔은 OK','카페인을 이길수있나요?','커피리브레','취미','태그','1608803861742_photo-1511537190424-bbbab87ac5eb.jfif','전국방방곡곡','YInfo',to_date('202012241857:44','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('554','dlrkdwns321','가벼운 홈트레이닝 모임입니다^^','집돌이 집순이 다모이세요','가벼운홈트레이닝','운동','태그','1608803937876_home.jpg','서울','YInfo',to_date('202012241858:58','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('555','no1dev','빠빠빠빨간맛 궁금해 허니','떡볶이를 좋아하시는 분들!','전국떡볶이파먹기','취미','태그','1608804045204_880134_302005_3430.png','전국','YInfo',to_date('202012241900:47','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('556','dlrkdwns321','절권도에 대한 정보 공유 동아리입니다','꾸준히 오실분만','브루스 리  프로젝트','운동','태그','1608804773390_lee.jpg','부산','YInfo',to_date('202012241912:53','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('557','dlrkdwns321',null,null,'이크에크','운동','태그','1608804911846_xorrus.jpg',null,'YInfo',to_date('202012241915:12','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('558','dlrkdwns321','검도란 무엇인가 에 대한 고찰과 연구하는 동아리입니다','열심히 합시다','劒道','운동','태그','1608805033395_rjaeh.jpg','대구','YInfo',to_date('202012241917:13','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('563','isk01183','여행 정보 공유하실분~','x','즐거운여행','기타','태그','1609121419536_ancient-5302626.jpg','x','YInfo',to_date('202012281110:19','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('564','isk01183','필기하는법,메모이쁘게하는법 공유해요','x','메모하는법','기타','태그','1609121486172_apple-1867752.jpg','x','YInfo',to_date('202012281111:26','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('565','isk01183','인테리어 정보 공유해요','x','집꾸미기','기타','태그','1609121547930_laptop-5582775.jpg','x','YInfo',to_date('202012281112:28','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('566','isk01183','각종 재료의 영양소를 분석해서 공유해요','x','음식재료분석','기타','태그','1609121634199_rachel-park-hrlvr2ZlUNk-unsplash.jpg','x','YInfo',to_date('202012281113:54','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('567','isk01183','이쁜 사진이랑 배경화면 공유해요','x','이쁜 이미지','기타','태그','1609121963893_sunset-over-bratislava-slovakia-and-famous-ufo-tower-picjumbo-com.jpg','x','YInfo',to_date('202012281119:24','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('572','isk01183','배구 전략 정보 공유하고 같이 재밋게 배구해요','x','즐거운 배구','운동','태그','1609123758877_volleyball-1977364.jpg','x','YInfo',to_date('202012281149:19','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('574','isk01183','마비노기 정보 공유해요','x','Mabinogi','게임','태그','1609124465509_mabinogi.PNG','x','YInfo',to_date('202012281201:06','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('573','isk01183','농구의 정보 공유및 같이 농구해요','x','농구동아리','운동','태그','1609123871150_basketball-hoop-463458.jpg','x','YInfo',to_date('202012281151:11','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('575','isk01183','같이 롤정보 공유하고 같이 플레이해요','x','LOL','게임','태그','1609124562651_10f94e3e-b1d9-4986-b63b-8ee5e2ba6e78.png','x','YInfo',to_date('202012281202:43','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('576','isk01183','Final Fantasy 정보 및 공략 공유하고
같이 즐기면서 게임해요','x','FinalFantasy','게임','태그','1609124761534_ffxiv_logo.png','x','YInfo',to_date('202012281206:03','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('577','isk01183','안녕하세요 모동숲의 인테리어 공유해요','스위치보유자','모동숲','게임','태그','1609126015326_maxresdefault.jpg','xx섬(xx도)','YInfo',to_date('202012281226:56','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('578','isk01183','같이 일본어 공부해요','x','日本語','공부','태그','1609126623212_2-1.jpg','x','YInfo',to_date('202012281237:03','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('582','isk01183','애니를 공부해봐요. 즐거리 애니속 신화 등','x','애니 연구소','공부','태그','1609129177455_Frozen-thick-snow-Cartoon-movie_1920x1440.jpg','x','YInfo',to_date('202012281319:37','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('580','isk01183','같이 unity 3d 공부해요','x','Unity 3D','공부','태그','1609126865807_009f13504b09a23c16331c97.jpg','x','YInfo',to_date('202012281241:06','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('581','isk01183','같이 3DS  MAX 공부해요','x','3DS  MAX','공부','태그','1609128699667_655.PNG','x','YInfo',to_date('202012281311:40','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('583','isk01183','같이 별자리에 대한 이야기를 하고 관련된 재밋는 이야기를 해요','x','신기한 별자리','공부','태그','1609129327630_833266554_iSIxjXoa_maxresdefault-3.jpg','x','YInfo',to_date('202012281322:08','YYYYMMDDHH24MI:SS'));
Insert into TBL_CIR (C_CODE,C_PID,C_WELCOME,C_CONDITION,C_NAME,C_CATEGORY,C_TAG,C_PIC,C_SPOT,C_PCHK,C_REGDATE) values ('607','tjsrhks623','123','가입조건','test','게임','태그','1609202122003_inter.JPG','도림동','YInfo',to_date('202012290935:22','YYYYMMDDHH24MI:SS'));
REM INSERTING into TBL_CN
SET DEFINE OFF;
Insert into TBL_CN (CN_NO,C_CODE,ID,CN_TITLE,CN_REGDATE,CN_CONTENT,CN_BOLD,CN_RCHK) values (584,'520','no1dev','[서평이벤트]웹 서비스를 만들며 배우는 node.js',to_date('202012241712:48','YYYYMMDDHH24MI:SS'),'안녕하세요. 제이펍출판사에서 신간이 출간하여 하코사와 함께 서평이벤트 진행합니다.

* 웹 서비스를 만들며 배우는 node.js 프로그래밍

Node.js를 이용한 웹 서버 제작 방법을 단계별로 설명하면서 그 과정에서 파생하는 이슈나 문제 해결 과정을 담고 있습니다.
나아가 페이스북 챗봇 개발과 Node.js를 이용한 구글 스프레드시트 제작 방법도 다루고 있어서 스타트업에 몸담고 있는 개발자이거나 자바스크립트나 웹 개발을 공부하였지만 스스로 서버를 만드는 데 부담을 가졌던 개발자들에게 유익한 책이 될 것 같습니다.


[신청 방법] 책을 읽고 싶은 이유를 댓글로 달아주세요.
[모집 인원] 5명
[발표] 7월 31일(화)
[발송 예정일] 8월 6일(월)


- 당첨자 미션
[리뷰 기간] ~2018년 8월 20일(월) #도서 수령 후 2주 이내

*서평은 개인 블로그 및 온라인 서점(최소 2곳 이상), 네이버 책 정보, 카페 등에 서평을 올리신 후, 게시글 링크를 (jeipubmarketer@gmail.com)보내주세요.
[출처] [당첨자안내][서평이벤트]웹 서비스를 만들며 배우는 node.js 프로그래밍 5권 (하드코딩하는사람들) | 작성자 야쿠',0,1);
Insert into TBL_CN (CN_NO,C_CODE,ID,CN_TITLE,CN_REGDATE,CN_CONTENT,CN_BOLD,CN_RCHK) values (583,'520','no1dev','하코사 2021 ZOOM 세미나개최',to_date('202012241711:45','YYYYMMDDHH24MI:SS'),'참가비 및 결제방법 :

참가비는 15,000원으로 계좌 이체만 가능합니다.
본 행사는 신청서 작성 후 입금 확인이 된 분들에 한하여 참석 가능하며,
입금 시간 순서에 따라 선착순으로 참석 확정이 됩니다.
입금자명은 반드시 이름+전화번호 뒤 4자리로 해주세요. ( 예: 홍길동8181 )
신청서에 작성한 전화번호와 입금 메시지의 번호가 동일한지 확인해주세요.
입금 확인 된 신청자는 참가자명단의 참석 확정란에 "Y"로 표기 됩니다.
입금 확인이 수동으로 진행되기 때문에 상황에 따라 지연될 수 있습니다.
입금 하셨더라도 121번째 이후 입금이 된 경우에는 좌석이 모자르기 때문에 환불 처리 되오니 양해부탁드립니다.
입금확인은 실시간 확인이 되지 않고 점심시간, 저녁시간에 일괄로 처리 될 수 있습니다.
',1,1);
Insert into TBL_CN (CN_NO,C_CODE,ID,CN_TITLE,CN_REGDATE,CN_CONTENT,CN_BOLD,CN_RCHK) values (585,'520','no1dev','등업 규정 및 등급 안내',to_date('202012241715:02','YYYYMMDDHH24MI:SS'),'
§ 등업 규정 및 등급 안내
등업은 다음 조건에 따라 자동으로 이루어집니다.
1. 인턴
인턴 등급은 고민·진로·기타상담 게시판 등 일부 게시판에 접근이 제한됩니다.
2. 사원
등업 조건: 게시글 2개, 댓글 5개, 출석 7회, 가입 1주 후
사원 등급은 대부분의 게시판에 글을 올리거나 댓글을 달 수 있습니다.
3. 대리님
등업 조건: 게시글 30개, 댓글 30개, 출석 50회, 가입 4주 후
대리님 등급은 사원 등급과 동일한 제한을 가집니다.
4. 과장님
등업 조건: 게시글수 60개, 댓글수 40개, 출석수 100회, 가입 6주 후
과장님 등급은 "세미나/스터디 정보", "교육/세미나 홍보" 게시판에 게시글을 올릴 수 있습니다.
5. 이사님
등업 조건: 게시글 1500개, 댓글 1000개, 출석 360회, 가입 48주 후
이사님 등급은 과장님 등급과 동일한 제한을 가집니다.
* 의미 없는 게시글과 댓글 활동(같은 게시글이나 댓글 지속적 반복 / 의미 없거나 성의 없는 게시글과 댓글 반복)으로 등업을 했을 경우는 해당 게시글 및 댓글 삭제, 강등이나 강퇴처리 될 수 있습니다.

',0,0);
Insert into TBL_CN (CN_NO,C_CODE,ID,CN_TITLE,CN_REGDATE,CN_CONTENT,CN_BOLD,CN_RCHK) values (586,'520','no1dev','게시판 이용 규정',to_date('202012241715:51','YYYYMMDDHH24MI:SS'),'1. 게시물 삭제 (공통)
아래 게시물 삭제 조건에 해당하는 경우 통보없이 삭제되며, 경우에 따라 활동 정지 또는 강퇴 될 수 있습니다.
1) 게시판 성격에 맞지 않는 글게시판 성격에 맞지 않는 글
각 게시판의 주제와 성격에 맞지 않게 게시되는 글은 통보 없이 삭제 됩니다.
2) 광고글
광고글은 엄격하게 금지됩니다. 운영진의 판단에 따라 광고글은 통보 없이 삭제됩니다.
다음 항목들은 모두 광고로 간주됩니다.
- 타카페 가입 유도 (스터디 포함)
- 오픈 톡방 홍보 및 가입 유도
- 수다를 빙자한 개인 블로그/유투브/카페 등으로의 유입 증대를 목적으로 하는 링크 등록
3) 중복글/도배글
불필요한 중복글은 최초 한 개의 글만을 제외하고 모두 삭제합니다.
끌어올림이 필요한 경우에는 기존 글을 삭제하여 중복 글이 없도록 해주시기 바랍니다.
4) 양식을 지키지 않는 글
특정 게시판의 경우는 양식이 존재합니다.
해당 양식에 명시되어 있지 않은 한, 양식을 지키지 않았을 경우 해당 글은 통보 없이 삭제 됩니다.
5) 그 외 운영진이 필요하다고 판단하는 경우
신고가 들어온 게시글, 카페에 적합하지 않은 게시글이라 판단되는 경우 해당 게시글은 무통보 삭제됩니다.
2. 질문 답변 게시판 이용 규정
질문 게시판 이용 안내 참고
3. 채용 정보 게시판 이용 규정
채용정보 글 작성시 주의사항 참고
',0,0);
Insert into TBL_CN (CN_NO,C_CODE,ID,CN_TITLE,CN_REGDATE,CN_CONTENT,CN_BOLD,CN_RCHK) values (587,'520','no1dev','하코사 이용 시 주의사항',to_date('202012241716:23','YYYYMMDDHH24MI:SS'),'1. 카페 게시글에 대한 법적인 권한과 책임은 모두 회원님 본인에게 있으니, 본인의 게시물 중 불법적인 글이 없는지 꼭 확인해 주시기 바랍니다.
- 저작권법 위반 소지가 있는 글
- 명예훼손, 업무 방해 등의 소지가 있는 글
- 그 외 법에 저촉되는 모든 경우
2. 개인 정보 유출
멘토 / 멘티를 구하기 위해 게시글에 전화번호등을 그대로 노출시키는 분들이 계십니다.
개인정보를 그대로 노출할 경우 스토킹 등 각종 범죄에 노출 될 수 있으니 가급적 개인정보 노출을 삼가해 주시기 바랍니다.
3. 오프모임
멘토/멘티, 과외, 스터디 모임 등에 의한 피해 사례가 있습니다.
하코사에서 진행하는 공식 모임 외에는 모두 하코사에서 공식적으로 여는 모임이 아니므로 회원님들이 잘 판단하여 피해를 받지 않도록 주의해 주세요.
회원님들의 부주의로 일어난 피해 사례에 대해서 카페는 어떠한 관여도, 책임도 지지 않습니다.
',0,0);
Insert into TBL_CN (CN_NO,C_CODE,ID,CN_TITLE,CN_REGDATE,CN_CONTENT,CN_BOLD,CN_RCHK) values (588,'520','no1dev','활동 패널티 규정',to_date('202012241716:43','YYYYMMDDHH24MI:SS'),'
1. 활동 정지
1) 스팸, 광고글
아이디 해킹이 의심되는 경우, 광고글 도배를 막기 위해 임시적으로 활동 정지 처리 합니다.
활동 정지 기간 중 다시 활동이 필요한 경우 스탭에게 메일이나 쪽지를 주시면 활동 정지 해제해 드립니다.
* 가입일이 한 달 이내, 스팸 광고글 외 정상 게시글이 1개 이상인 경우 해킹으로 간주합니다.
2) 카페 규정에 어긋나거나 그 외 운영진이 필요하다고 판단되는 경우
2. 재가입불가 강퇴
1) 스팸, 광고글
하코사 가입 후 한 달 이내 스팸 광고글 외 정상 게시글이 전혀 없으면서 스팸, 광고글이 게시되는 경우, 바로 스팸, 광고글 삭제 후 재가입불가 강퇴 처리 됩니다.
강퇴처리 되었으나 아이디 도용일 경우 스탭에게 메일을 주시면 재가입 가능으로 변경해드립니다.
2) 패널티 회피를 위한 탈퇴
하코사 규정에 따라 활동 정지가 된 경우 이를 회피할 목적으로 재가입을 위해 탈퇴한 계정이 발견되는 경우, 해당 계정은 재가입불가 처리 됩니다.
마찬가지로, 질문 답변 게시판 이용 규칙에 따라 답변을 받은 질문 삭제 후 탈퇴 시 활동 의사가 없는 것으로 간주하고 재가입불가 처리 됩니다.
3) 재가입불가로 강퇴된 회원이 다른 아이디로 가입한 후, 이전 강퇴된 아이디와 동일인으로 판단되는 경우
4) 욕설 및 분쟁글
회원님들 간에 욕설, 비속어등이 오가거나, 카페 내 분쟁을 일으키는 경우.
5) 그 외 운영진이 필요하다고 판단되는 경우
[출처] 하코사 카페 규정 (하드코딩하는사람들) | 작성자 멀더끙',0,0);
Insert into TBL_CN (CN_NO,C_CODE,ID,CN_TITLE,CN_REGDATE,CN_CONTENT,CN_BOLD,CN_RCHK) values (589,'520','no1dev','이메일 무단 수집 금지',to_date('202012241717:37','YYYYMMDDHH24MI:SS'),'금일 하코사를 통해 수집한 이메일로 UI LXX 이라는 회사에서 보낸 메일을 받으신 회원분을이 몇 분 계실 것으로 예상합니다.
( 해당 회원에 대해서는 현재 강퇴 처리 되었습니다. )

하코사에 게시된 이메일을 광고 혹은 홍보용으로 수집하는 행위는
정보통신망법률 제50조의2 (전자우편주소의 무단 수집행위 등 금지)에 의해 1천만원 이하의 벌금형에 처해질 수 있습니다.

하코사에 게시글에 기재된 이메일 주소는 어디까지나 회원들간의 연락이나, 채용 공고, 구직 공고를 위한 용도일 뿐
결코 영리를 목적으로 하는 홍보용으로 사용될 수 없습니다.

해당 행위의 발각 시 하코사에서 강제 탈퇴 조취를 할 것이며,
필요시 형사 고발을 취할 수 있으니 유념하시기 바랍니다.
',0,0);
REM INSERTING into TBL_CNR
SET DEFINE OFF;
Insert into TBL_CNR (CNR_NO,C_CODE,CN_NO,ID,CNR_REGDATE,CNR_CONTENT) values (442,'520',583,'no1dev',to_date('202012241759:03','YYYYMMDDHH24MI:SS'),'네 저도 내년엔 꼭 여러분들 얼굴 보고싶어요! 그때까지 좀만 버텨요 우리');
Insert into TBL_CNR (CNR_NO,C_CODE,CN_NO,ID,CNR_REGDATE,CNR_CONTENT) values (443,'520',583,'isk01183',to_date('202012242013:04','YYYYMMDDHH24MI:SS'),'와 계좌번호는 어디에 나와있나요?');
Insert into TBL_CNR (CNR_NO,C_CODE,CN_NO,ID,CNR_REGDATE,CNR_CONTENT) values (441,'520',583,'lalaUlalaU',to_date('202012241755:21','YYYYMMDDHH24MI:SS'),'와 꼭 함께하고싶어요 온라인말고 오프라인에서ㅠㅠ 2021에는 오프라인으로 볼수있겟죠?');
REM INSERTING into TBL_CU
SET DEFINE OFF;
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('443','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('449','dlwkdgml112','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('450','qq','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('443','qq','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('551','master','y    ','y    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('607','tjsrhks623','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('576','no1dev','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('463','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('483','rlackdtn123','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('465','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('563','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('503','rlackdtn123','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('504','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('505','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('509','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('510','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('508','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('511','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('512','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('513','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('514','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('515','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('516','plove','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('517','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('518','pave_LL','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('519','lalaUlalaU','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('520','no1dev','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('564','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('565','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('520','Guwolo','y    ','y    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('519','Guwolo','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('566','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('513','Guwolo','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('572','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('508','Guwolo','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('503','Guwolo','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('567','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('503','sToveee','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('520','sToveee','y    ','y    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('508','sToveee','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('513','sToveee','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('573','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('503','plove','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('520','plove','y    ','y    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('508','plove','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('513','plove','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('578','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('503','pave_LL','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('520','pave_LL','y    ','y    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('508','pave_LL','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('513','pave_LL','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('574','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('503','lalaUlalaU','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('520','lalaUlalaU','y    ','y    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('508','lalaUlalaU','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('513','lalaUlalaU','y    ','n    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('520','dlwkdgml112','y    ','y    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('543','dlwkdgml112','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('520','cds301','y    ','y    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('544','rlackdtn123','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('545','dlrkdwns321','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('546','no1dev','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('547','cds301','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('548','cds301','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('549','no1dev','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('550','cds301','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('551','no1dev','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('552','cds301','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('553','no1dev','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('554','dlrkdwns321','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('555','no1dev','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('520','tjsrhks623','y    ','y    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('556','dlrkdwns321','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('557','dlrkdwns321','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('558','dlrkdwns321','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('520','isk01183','y    ','y    ','y');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('575','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('576','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('577','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('581','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('580','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('582','isk01183','y    ','y    ','n');
Insert into TBL_CU (C_CODE,ID,CU_PCHK,CU_SCHK,CU_FCHK) values ('583','isk01183','y    ','y    ','n');
REM INSERTING into TBL_EVENT
SET DEFINE OFF;
Insert into TBL_EVENT (E_NO,ID,E_TITLE,E_REGDATE,E_CONTENT) values (61,'master','OTTAE와 함께하는 크리스마스 이벤트',to_date('202012231006:32','YYYYMMDDHH24MI:SS'),'이벤트 기간 : 2020-12-23 ~ 2020-12-31<br>
<br>
<br>
이벤트 진행 방법<br>
<br>
1. <br>
<br>
2. <br>
<br>
3.<br>
<br>
4. 이메일(dksehdgus18@naver.com)로 제목 앞에 "[OTTAE]" 를 입력후 전송합니다.<br>
<br>
<br>
※보상<br>
-CU기프티콘(100,000) 10팀<br>
-스타벅스 아메리카노 기프티콘(10개) 20팀<br>
<br>
추첨일 2021-01-01<br>
<br>
※안내사항<br>
-동아리 1개당 1회 신청 가능합니다.<br>
-제목 앞에 다른 태그를 입력시 지급 대상에서 제외됩니다 ( [OTTAE]- o, [OTTAe]- x ).<br>
-비정상적으로 이벤트를 참여한 기록이 확인될 경우 지급 대상에서 제외됩니다.<br>
');
Insert into TBL_EVENT (E_NO,ID,E_TITLE,E_REGDATE,E_CONTENT) values (4,'master','사이트 오픈 이벤트',to_date('202012041818:41','YYYYMMDDHH24MI:SS'),'사이트 오픈 이벤트');
REM INSERTING into TBL_GROUP
SET DEFINE OFF;
Insert into TBL_GROUP (G_CODE,G_PIC,G_PASS,G_REGDATE,G_NAME) values (563,'1608769724148_시간.jpg','group2final!',to_date('202012240928:46','YYYYMMDDHH24MI:SS'),'2조 프로젝트 일정 모임');
Insert into TBL_GROUP (G_CODE,G_PIC,G_PASS,G_REGDATE,G_NAME) values (583,'1608786289905_photo-1585331505473-7586f9cb0854.jfif','123456789!Q',to_date('202012241404:52','YYYYMMDDHH24MI:SS'),'방탈출');
REM INSERTING into TBL_GU
SET DEFINE OFF;
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('tjsrhks623',563,'Y    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('master',563,'Y    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('rlackdtn123',583,'N    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('cds301',563,'Y    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('isk01183',563,'Y    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('no1dev',563,'Y    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('qq',563,'Y    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('Guwolo',563,'Y    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('sToveee',563,'Y    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('dlrkdwns321',563,'N    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('pave_LL',563,'Y    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('lalaUlalaU',563,'Y    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('rlackdtn123',563,'N    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('jtn28',563,'N    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('plove',563,'Y    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('no1dev',583,'Y    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('master',583,'N    ');
Insert into TBL_GU (ID,G_CODE,GU_PWCHK) values ('dlwkdgml112',563,'N    ');
REM INSERTING into TBL_NOTICE
SET DEFINE OFF;
Insert into TBL_NOTICE (N_NO,ID,N_TITLE,N_REGDATE,N_CONTENT) values (1,'master','고객상담실 임시 휴무 안내',to_date('202012040907:44','YYYYMMDDHH24MI:SS'),'안녕하세요, 고객 여러분.<br>
<br>
<br>
<br>
코로나19 확산 방지를 위해 <br>
<br>
고객상담실은 12월 10일(목)까지 휴무 예정입니다.<br>
<br>
고객 여러분들의 너그러운 이해를 부탁드립니다.<br>
<br>
<br>
<br>
■ 고객상담실 휴무 기간 : 2020년 12월 04일(금) ~ 12월 10일(목)<br>
<br>
<br>
<br>
고객상담실 휴무에도 온라인 고객상담 접수는 가능하오니, <br>
<br>
문의 사항이 있으실 경우 [이메일dksehdgus18@naver.com)]을 이용하여 주시면 <br>
<br>
빠른 시일 내에 답변 드리도록 최선을 다하겠습니다.<br>
<br>
<br>
<br>
감사합니다.');
Insert into TBL_NOTICE (N_NO,ID,N_TITLE,N_REGDATE,N_CONTENT) values (141,'master','프로젝트 발표 리허설 관련 안내사항',to_date('202012241103:01','YYYYMMDDHH24MI:SS'),'안녕하세요, 고객 여러분.<br>
프로젝트 발표 리허설 관련 상세 내용입니다.
<br>
<br>
■ 발표 리허설 일시 : 2020년 12월 28일(월)<br
><br>
■  발표자 : 김선관<br>
<br>
■ 시간 : 약 2시(?)<br>
<br>
<br>
■ 문의 사항이 있으실 경우 [이메일( jtn28@naver.com )]를 이용하여 주시면 <br>
<br>
빠른 시일 내에 답변 드리도록 최선을 다하겠습니다.<br>
<br>
감사합니다.<br>
<br>
<br>
※참고사항<br>
-관계자의 사정에 따라 시간이 변경 될 수도 있습니다.

안녕');
Insert into TBL_NOTICE (N_NO,ID,N_TITLE,N_REGDATE,N_CONTENT) values (84,'master','프로젝트 발표 안내사항',to_date('202012071301:38','YYYYMMDDHH24MI:SS'),'안녕하세요, 고객 여러분.<br>
<br>
코로나19 확산 방지를 위해 <br>
zoom으로 발표를 진행 합니다.<br>
<br>
고객 여러분들의 너그러운 이해를 부탁드립니다.<br>
<br>
<br>
■ 발표 리허설 일시 : 2020년 12월 28일(월)<br>
   발표자 : 김선관<br>
<br>
<br>
■ 본 방송 일시 : 2020년 12월 29일(화)<br>
   발표자 : 김선관<br>
<br>
<br>
■ 문의 사항이 있으실 경우 [이메일( jtn28@naver.com )]를 이용하여 주시면 <br>
<br>
빠른 시일 내에 답변 드리도록 최선을 다하겠습니다.<br>
<br>
<br>
감사합니다.<br>');
Insert into TBL_NOTICE (N_NO,ID,N_TITLE,N_REGDATE,N_CONTENT) values (101,'master','고객상담실 임시 휴무 연장 안내',to_date('202012081309:28','YYYYMMDDHH24MI:SS'),'안녕하세요, 고객 여러분.<br>
<br>
<br>
<br>
코로나19 확산 방지를 위해 <br>
<br>
고객상담실 휴무가 12월 24일(목)까지 연장될 예정입니다.<br>
<br>
 <br>
<br>
고객 여러분들의 너그러운 이해를 부탁드립니다.<br>
<br>
 <br>
<br>
■ 고객상담실 휴무 기간 : 2020년 12월 04일(금) ~ 12월 24일(목)<br>
<br>
 <br>
<br>
고객상담실 휴무에도 온라인 고객상담 접수는 가능하오니, <br>
<br>
문의 사항이 있으실 경우 [이메일( dksehdgus18@naver.com )]를 이용하여 주시면 <br>
<br>
빠른 시일 내에 답변 드리도록 최선을 다하겠습니다.<br>
<br>
<br>
<br>
감사합니다.');
REM INSERTING into TBL_QNA
SET DEFINE OFF;
Insert into TBL_QNA (Q_NO,ID,Q_REGDATE,Q_TITLE,Q_CONTENT) values (1,'master',to_date('202012070938:00','YYYYMMDDHH24MI:SS'),'비밀번호를 잊어버렸어요','- - - - - - - - - - - - - - - - - - - - - - - -<br>
<br>
아이디 : <br>
이름 :<br>
생일 : <br>
휴대폰 번호 :<br>
<br>
변경하실 비밀번호 :<br>
<br>
- - - - - - - - - - - - - - - - - - - - - - - -<br>
<br>
상단에 정보를 작성하신후 이메일로 전송 부탁드립니다.<br>
dksehdgus18@naver.com');
Insert into TBL_QNA (Q_NO,ID,Q_REGDATE,Q_TITLE,Q_CONTENT) values (66,'master',to_date('202012241112:02','YYYYMMDDHH24MI:SS'),'탈퇴 후 개설한 동아리는 유지되나요?','고객님이 개설한 동아리 및 모임은 전부 삭제 처리가 되면서 정보가 남지 않습니다.<br>
개설한 동아리, 모임이 있으신 경우 복구가 불가하오니.<br>
주변 사람에게 먼저 알려주신 후 탈퇴 하시길 바랍니다.');
Insert into TBL_QNA (Q_NO,ID,Q_REGDATE,Q_TITLE,Q_CONTENT) values (41,'master',to_date('202012230943:17','YYYYMMDDHH24MI:SS'),'비밀번호를 변경 하고 싶은 경우','- - - - - - - - - - - - - - - - - - - - - - - -<br>
<br>
아이디 : <br>
이름 :<br>
생일 : <br>
휴대폰 번호 :<br>
<br>
변경하실 비밀번호 :<br>
<br>
- - - - - - - - - - - - - - - - - - - - - - - -<br>
<br>
상단에 정보를 작성하신후 이메일로 전송 부탁드립니다.<br>
dksehdgus18@naver.com');
Insert into TBL_QNA (Q_NO,ID,Q_REGDATE,Q_TITLE,Q_CONTENT) values (68,'master',to_date('202012241112:49','YYYYMMDDHH24MI:SS'),'탈퇴 후 개설한 모임은 유지되나요?','고객님이 개설한 동아리 및 모임은 전부 삭제 처리가 되면서 정보가 남지 않습니다.<br>
개설한 동아리, 모임이 있으신 경우 복구가 불가하오니.<br>
주변 사람에게 먼저 알려주신 후 탈퇴 하시길 바랍니다.');
REM INSERTING into TBL_USER
SET DEFINE OFF;
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('isk01183','1234','전영진','1994-11-02','010-3394-0467','인천 연수구 학나래로46번길 7-7',null,'jtn28@naver.com','m    ','게임','default.jpg',485);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('jtn28','1','유규민','1994-05-14','010-0000-0467','경남 창원시 성산구 진해대로 52',null,'jtn28@naver.com','m    ','                     ','default.jpg',486);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('dlwkdgml112','gustlr12','이장희','1997-10-02','010-9443-1262','인천 부평구 장제로 125','라일플로리스 ','dlwkdgml112@naver.com','m    ','                     #게임#운동','1608685078193_KakaoTalk_20201123_083215884.jpg',490);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('no1dev','12345678','조새벽','1990-06-13','010-6649-3550','인천 연수구 송도과학로27번길 55',null,'aubepe@naver.com','f    ','#개발#클라이밍       ','1608781114932_cho (3).jpg',488);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('qq','12345678','곽만춘','1993-10-19','010-4437-2293','인천 강화군 불은면 중앙로679번길 25',null,'wuu_no@naver.com','m    ','           #스케이트#간지          ','default.jpg',489);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('Guwolo','12345678','강필규','1986-09-15','010-6637-2233','서울 강남구 강남대로 238',null,'au_q@naver.com','m    ','#야구#게임','default.jpg',496);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('sToveee','12345678','tim cook','1960-11-06','010-3384-8765','인천 부평구 부흥북로58번길 5',null,'sToveee@naver.com','m    ','#Coding#Apple','1608690584393_apple.jfif',497);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('dlrkdwns321','gustlr12','이강준','1996-02-12','010-4778-5588','서울 강서구 화곡동 377-42',null,'dlwkdgml123123@naver.com','m    ','               #운동#복싱#체력     ','1608706797894_pngtree-vector-man-iconvector-people-icon-with-line-art-style-png-image_1507546.jpg',500);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('cds9046','12345678','최대식','1997-01-20','010-7759-9046','인천 동구 인중로 621',null,'fdsa3001@naver.com','m    ','#게임','1609123517864_최대식.jpg',546);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('rlackdtn123','gustlr12','김창수','1968-05-08','010-4692-2385','서울 강남구 강남대로 238','dlrkdwns321','ckdtn112@naver.com','m    ','                     #와인#낚시#자전거','default.jpg',505);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('tjsrhks623','1234','김선관','1995-10-15','010-5258-0142','인천 남동구 오봉로 33','201동 502호','tjsrhks623@naver.com','m    ','축구, 달리기, 프로그래밍, 독서','1608769143114_일정.jpg',525);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('cds301','1234','최대식','1997-01-20','010-7759-9046','인천 동구 인중로 621',null,'fdsa301@naver.com','m    ','#게임#영화#운동   ','1608772300142_최대식.jpg',526);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('plove','12345678','이마루','1990-06-13','010-7878-7899','인천 연수구 아트센터대로 175',null,'plove@gmail.com','f    ','#맥주#소주#만화','default.jpg',527);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('pave_LL','12345678','강도산','1993-11-17','010-5548-7898','서울 송파구 풍성로 4',null,'pave_LL@naver.com','m    ','#영어공부#SAT','default.jpg',528);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('master','pass','master','2020-11-30','000-0000-0000','인천 광역시 학익동','인천일보 아카데미','master','m    ','#final_froject','1606729510903_myimg01.png',105);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('lalaUlalaU','12345678','강실장','1990-06-13','010-7798-1324','서울 마포구 큰우물로4길 5',null,'lalaUlalaU@naver.com','f    ','#맥주#배구#심령','default.jpg',529);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('hajin1410','1234','박소희','1990-06-13','010-0000-0000','서울 강남구 학동로 지하 102',null,'hajin1410@naver.com','f    ','                     ','default.jpg',530);
Insert into TBL_USER (ID,PW,NAME,BIRTHDAY,PHONE,ADDR,ADDRDETAIL,EMAIL,GENDER,U_KEYWORD,IMAGE,UNO) values ('jtn47','1234','유주연','1990-12-13','010-0000-0000','서울 강남구 강남대로 708',null,'jtn47@naver.com','m    ','                     ','default.jpg',531);
--------------------------------------------------------
--  DDL for Index PK_CU
--------------------------------------------------------

CREATE UNIQUE INDEX "PK_CU" ON "TBL_CU" ("C_CODE", "ID")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007259
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007259" ON "TBL_USER" ("ID")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007274
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007274" ON "TBL_CIR" ("C_CODE")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007285
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007285" ON "TBL_CB" ("CB_NO")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007289
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007289" ON "TBL_CBR" ("CBR_NO")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007513
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007513" ON "TBL_GROUP" ("G_CODE")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007514
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007514" ON "TBL_GU" ("G_CODE", "ID")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007802
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007802" ON "TBL_CN" ("CN_NO")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007806
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007806" ON "TBL_CNR" ("CNR_NO")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007858
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007858" ON "TBL_NOTICE" ("N_NO")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007863
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007863" ON "TBL_EVENT" ("E_NO")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007916
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007916" ON "TBL_QNA" ("Q_NO")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008041
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008041" ON "TBL_CAL" ("CALNO")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table TBL_CAL
--------------------------------------------------------

ALTER TABLE "TBL_CAL" ADD PRIMARY KEY ("CALNO")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
ALTER TABLE "TBL_CAL" MODIFY ("TITLE" NOT NULL ENABLE);
ALTER TABLE "TBL_CAL" MODIFY ("end" NOT NULL ENABLE);
ALTER TABLE "TBL_CAL" MODIFY ("start" NOT NULL ENABLE);
ALTER TABLE "TBL_CAL" MODIFY ("USERNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_CB
--------------------------------------------------------

ALTER TABLE "TBL_CB" ADD PRIMARY KEY ("CB_NO")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
ALTER TABLE "TBL_CB" MODIFY ("CB_CONTENT" NOT NULL ENABLE);
ALTER TABLE "TBL_CB" MODIFY ("CB_REGDATE" NOT NULL ENABLE);
ALTER TABLE "TBL_CB" MODIFY ("CB_TITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_CBR
--------------------------------------------------------

ALTER TABLE "TBL_CBR" ADD PRIMARY KEY ("CBR_NO")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
ALTER TABLE "TBL_CBR" MODIFY ("CBR_CONTENT" NOT NULL ENABLE);
ALTER TABLE "TBL_CBR" MODIFY ("CBR_REGDATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_CIR
--------------------------------------------------------

ALTER TABLE "TBL_CIR" ADD PRIMARY KEY ("C_CODE")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
ALTER TABLE "TBL_CIR" MODIFY ("C_REGDATE" NOT NULL ENABLE);
ALTER TABLE "TBL_CIR" MODIFY ("C_PCHK" NOT NULL ENABLE);
ALTER TABLE "TBL_CIR" MODIFY ("C_TAG" NOT NULL ENABLE);
ALTER TABLE "TBL_CIR" MODIFY ("C_CATEGORY" NOT NULL ENABLE);
ALTER TABLE "TBL_CIR" MODIFY ("C_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_CN
--------------------------------------------------------

ALTER TABLE "TBL_CN" ADD PRIMARY KEY ("CN_NO")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
ALTER TABLE "TBL_CN" MODIFY ("CN_CONTENT" NOT NULL ENABLE);
ALTER TABLE "TBL_CN" MODIFY ("CN_REGDATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_CNR
--------------------------------------------------------

ALTER TABLE "TBL_CNR" ADD PRIMARY KEY ("CNR_NO")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
ALTER TABLE "TBL_CNR" MODIFY ("CNR_CONTENT" NOT NULL ENABLE);
ALTER TABLE "TBL_CNR" MODIFY ("CNR_REGDATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_CU
--------------------------------------------------------

ALTER TABLE "TBL_CU" ADD CONSTRAINT "PK_CU" PRIMARY KEY ("C_CODE", "ID")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
ALTER TABLE "TBL_CU" MODIFY ("CU_FCHK" NOT NULL ENABLE);
ALTER TABLE "TBL_CU" MODIFY ("CU_SCHK" NOT NULL ENABLE);
ALTER TABLE "TBL_CU" MODIFY ("CU_PCHK" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_EVENT
--------------------------------------------------------

ALTER TABLE "TBL_EVENT" ADD PRIMARY KEY ("E_NO")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
ALTER TABLE "TBL_EVENT" MODIFY ("E_CONTENT" NOT NULL ENABLE);
ALTER TABLE "TBL_EVENT" MODIFY ("E_REGDATE" NOT NULL ENABLE);
ALTER TABLE "TBL_EVENT" MODIFY ("E_TITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_GROUP
--------------------------------------------------------

ALTER TABLE "TBL_GROUP" ADD PRIMARY KEY ("G_CODE")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
ALTER TABLE "TBL_GROUP" MODIFY ("G_REGDATE" NOT NULL ENABLE);
ALTER TABLE "TBL_GROUP" MODIFY ("G_PASS" NOT NULL ENABLE);
ALTER TABLE "TBL_GROUP" MODIFY ("G_PIC" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_GU
--------------------------------------------------------

ALTER TABLE "TBL_GU" ADD PRIMARY KEY ("G_CODE", "ID")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TBL_NOTICE
--------------------------------------------------------

ALTER TABLE "TBL_NOTICE" ADD PRIMARY KEY ("N_NO")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
ALTER TABLE "TBL_NOTICE" MODIFY ("N_CONTENT" NOT NULL ENABLE);
ALTER TABLE "TBL_NOTICE" MODIFY ("N_REGDATE" NOT NULL ENABLE);
ALTER TABLE "TBL_NOTICE" MODIFY ("N_TITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_QNA
--------------------------------------------------------

ALTER TABLE "TBL_QNA" ADD PRIMARY KEY ("Q_NO")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
ALTER TABLE "TBL_QNA" MODIFY ("Q_CONTENT" NOT NULL ENABLE);
ALTER TABLE "TBL_QNA" MODIFY ("Q_TITLE" NOT NULL ENABLE);
ALTER TABLE "TBL_QNA" MODIFY ("Q_REGDATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_USER
--------------------------------------------------------

ALTER TABLE "TBL_USER" ADD PRIMARY KEY ("ID")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
ALTER TABLE "TBL_USER" MODIFY ("UNO" NOT NULL ENABLE);
ALTER TABLE "TBL_USER" MODIFY ("IMAGE" NOT NULL ENABLE);
ALTER TABLE "TBL_USER" MODIFY ("U_KEYWORD" NOT NULL ENABLE);
ALTER TABLE "TBL_USER" MODIFY ("GENDER" NOT NULL ENABLE);
ALTER TABLE "TBL_USER" MODIFY ("EMAIL" NOT NULL ENABLE);
ALTER TABLE "TBL_USER" MODIFY ("ADDR" NOT NULL ENABLE);
ALTER TABLE "TBL_USER" MODIFY ("PHONE" NOT NULL ENABLE);
ALTER TABLE "TBL_USER" MODIFY ("BIRTHDAY" NOT NULL ENABLE);
ALTER TABLE "TBL_USER" MODIFY ("NAME" NOT NULL ENABLE);
ALTER TABLE "TBL_USER" MODIFY ("PW" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table TBL_CAL
--------------------------------------------------------

ALTER TABLE "TBL_CAL" ADD FOREIGN KEY ("USERNAME")
    REFERENCES "TBL_USER" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_CB
--------------------------------------------------------

ALTER TABLE "TBL_CB" ADD CONSTRAINT "FK_C_CODE_CB" FOREIGN KEY ("C_CODE", "ID")
    REFERENCES "TBL_CU" ("C_CODE", "ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_CBR
--------------------------------------------------------

ALTER TABLE "TBL_CBR" ADD CONSTRAINT "FK_CB_NO_CBR" FOREIGN KEY ("CB_NO")
    REFERENCES "TBL_CB" ("CB_NO") ENABLE;
ALTER TABLE "TBL_CBR" ADD CONSTRAINT "FK_C_CODE_CBR" FOREIGN KEY ("C_CODE", "ID")
    REFERENCES "TBL_CU" ("C_CODE", "ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_CIR
--------------------------------------------------------

ALTER TABLE "TBL_CIR" ADD CONSTRAINT "FK_CIR_PID" FOREIGN KEY ("C_PID")
    REFERENCES "TBL_USER" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_CN
--------------------------------------------------------

ALTER TABLE "TBL_CN" ADD CONSTRAINT "FK_C_CODE_CN" FOREIGN KEY ("C_CODE", "ID")
    REFERENCES "TBL_CU" ("C_CODE", "ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_CNR
--------------------------------------------------------

ALTER TABLE "TBL_CNR" ADD CONSTRAINT "FK_CN_NO_CNR" FOREIGN KEY ("CN_NO")
    REFERENCES "TBL_CN" ("CN_NO") ENABLE;
ALTER TABLE "TBL_CNR" ADD CONSTRAINT "FK_C_CODE_CNR" FOREIGN KEY ("C_CODE", "ID")
    REFERENCES "TBL_CU" ("C_CODE", "ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_CU
--------------------------------------------------------

ALTER TABLE "TBL_CU" ADD CONSTRAINT "FK_C_CODE_CU" FOREIGN KEY ("C_CODE")
    REFERENCES "TBL_CIR" ("C_CODE") ENABLE;
ALTER TABLE "TBL_CU" ADD CONSTRAINT "FK_ID_CU" FOREIGN KEY ("ID")
    REFERENCES "TBL_USER" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_EVENT
--------------------------------------------------------

ALTER TABLE "TBL_EVENT" ADD FOREIGN KEY ("ID")
    REFERENCES "TBL_USER" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_GU
--------------------------------------------------------

ALTER TABLE "TBL_GU" ADD CONSTRAINT "FK_GU_CODE" FOREIGN KEY ("G_CODE")
    REFERENCES "TBL_GROUP" ("G_CODE") ENABLE;
ALTER TABLE "TBL_GU" ADD CONSTRAINT "FK_GU_ID" FOREIGN KEY ("ID")
    REFERENCES "TBL_USER" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_NOTICE
--------------------------------------------------------

ALTER TABLE "TBL_NOTICE" ADD FOREIGN KEY ("ID")
    REFERENCES "TBL_USER" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_QNA
--------------------------------------------------------

ALTER TABLE "TBL_QNA" ADD FOREIGN KEY ("ID")
    REFERENCES "TBL_USER" ("ID") ENABLE;
