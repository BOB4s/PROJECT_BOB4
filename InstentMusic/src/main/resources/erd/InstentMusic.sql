
/* Drop Triggers */

DROP TRIGGER TRI_Comment_com_number;
DROP TRIGGER TRI_Customer_cust_number;
DROP TRIGGER TRI_Follow_fol_number;
DROP TRIGGER TRI_Key_Sound_key_number;
DROP TRIGGER TRI_Letter_let_number;
DROP TRIGGER TRI_like_click_like_number;
DROP TRIGGER TRI_Like_like_number;
DROP TRIGGER TRI_Member_mem_number;
DROP TRIGGER TRI_Music_Library_mus_number;
DROP TRIGGER TRI_Notification2_not_number;
DROP TRIGGER TRI_Notification_not_number;
DROP TRIGGER TRI_Part_music_make_number;
DROP TRIGGER TRI_Post_post_number;
DROP TRIGGER TRI_Post_tag_pt_number;
DROP TRIGGER TRI_recv_letter_let_number;
DROP TRIGGER TRI_Reply_rep_number;
DROP TRIGGER TRI_send_letter_let_number;
DROP TRIGGER TRI_Sound_Library_sou_number;
DROP TRIGGER TRI_Sound_mike_mike_number;
DROP TRIGGER TRI_Tag_tag_number;
DROP TRIGGER TRI_Temporary_temp_number;
DROP TRIGGER TRI_Temp_temp_number;
DROP TRIGGER TRI_User_user_number;



/* Drop Tables */

DROP TABLE Follow CASCADE CONSTRAINTS;
DROP TABLE like_click CASCADE CONSTRAINTS;
DROP TABLE Notification2 CASCADE CONSTRAINTS;
DROP TABLE Reply CASCADE CONSTRAINTS;
DROP TABLE Customer CASCADE CONSTRAINTS;
DROP TABLE Key_Sound CASCADE CONSTRAINTS;
DROP TABLE Post_tag CASCADE CONSTRAINTS;
DROP TABLE Post CASCADE CONSTRAINTS;
DROP TABLE Music_Library CASCADE CONSTRAINTS;
DROP TABLE Part_music CASCADE CONSTRAINTS;
DROP TABLE searchword CASCADE CONSTRAINTS;
DROP TABLE Sound_Library CASCADE CONSTRAINTS;
DROP TABLE Tag CASCADE CONSTRAINTS;
DROP TABLE Temp CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_Comment_com_number;
DROP SEQUENCE SEQ_Customer_cust_number;
DROP SEQUENCE SEQ_Follow_fol_number;
DROP SEQUENCE SEQ_Key_Sound_key_number;
DROP SEQUENCE SEQ_Letter_let_number;
DROP SEQUENCE SEQ_like_click_like_number;
DROP SEQUENCE SEQ_Like_like_number;
DROP SEQUENCE SEQ_Member_mem_number;
DROP SEQUENCE SEQ_Music_Library_mus_number;
DROP SEQUENCE SEQ_Notification2_not_number;
DROP SEQUENCE SEQ_Notification_not_number;
DROP SEQUENCE SEQ_Part_music_make_number;
DROP SEQUENCE SEQ_Post_post_number;
DROP SEQUENCE SEQ_Post_tag_pt_number;
DROP SEQUENCE SEQ_recv_letter_let_number;
DROP SEQUENCE SEQ_Reply_rep_number;
DROP SEQUENCE SEQ_send_letter_let_number;
DROP SEQUENCE SEQ_Sound_Library_sou_number;
DROP SEQUENCE SEQ_Sound_mike_mike_number;
DROP SEQUENCE SEQ_Tag_tag_number;
DROP SEQUENCE SEQ_Temporary_temp_number;
DROP SEQUENCE SEQ_Temp_temp_number;
DROP SEQUENCE SEQ_User_user_number;




/* Create Sequences */

CREATE SEQUENCE SEQ_Comment_com_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Customer_cust_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Follow_fol_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Key_Sound_key_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Letter_let_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_like_click_like_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Like_like_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Member_mem_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Music_Library_mus_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Notification2_not_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Notification_not_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Part_music_make_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Post_post_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Post_tag_pt_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_recv_letter_let_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Reply_rep_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_send_letter_let_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Sound_Library_sou_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Sound_mike_mike_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Tag_tag_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Temporary_temp_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Temp_temp_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_User_user_number INCREMENT BY 1 START WITH 1;



/* Create Tables */

-- Customer
CREATE TABLE Customer
(
	-- 회원번호 : 회원의 고유번호. 회원번호 시퀀스 사용 예정
	cust_number number NOT NULL,
	-- 회원 아이디 : 로그인할때의 회원 아이디
	cust_id varchar2(30) NOT NULL UNIQUE,
	-- 회원 비밀번호 : 로그인할때의 회원 비밀번호
	cust_password varchar2(30) NOT NULL,
	-- 회원 이메일 : 비밀번호 찾거나 인증을 위한 회원 이메일
	cust_email varchar2(50) NOT NULL,
	-- 회원의 닉네임 : 사이트 내에서 회원이 사용할 닉네임
	cust_nickname varchar2(20) NOT NULL UNIQUE,
	-- 프로필 자기소개 : 회원의 개인 프로필에 들어갈 자기소개 내용
	cust_introduce varchar2(1000),
	-- 회원 프로필 사진의 실제 이름 : 회원의 프로필에 등록한 사진의 원본 파일 이름
	cust_photo_original varchar2(500),
	-- cust_photo_saved : 회원 프로필 사진이 저장되고 나서의 사진 이름
	cust_photo_saved varchar2(500),
	-- 인증 키 : 회원가입 인증때 넘어오는 키
	cust_key varchar2(80),
	PRIMARY KEY (cust_number)
);


-- follow
CREATE TABLE Follow
(
	-- 팔로우 고유 넘버 : 팔로우 테이블의 고유 넘버. 시퀀스.
	fol_number number NOT NULL,
	-- 팔로워 회원 번호 : 팔로워의 회원 번호. Member table 참조
	follower_number number NOT NULL,
	-- 팔로우 회원 번호 : 팔로우의 회원 번호. member 테이블 참조
	follow_number number NOT NULL,
	PRIMARY KEY (fol_number)
);


-- key_sound
CREATE TABLE Key_Sound
(
	-- key 고유 번호 : 해당 테이블의 고유 번호
	key_number number NOT NULL,
	-- 회원 번호 : 해당 키를 지정하는 회원 번호
	cust_number number NOT NULL,
	-- 키보드 이름 : 사용자 정의의 전체 키보드 이름
	key_board varchar2(30) NOT NULL,
	-- 소리 이름 : 키에 매칭되는 소리 이름
	sou_name varchar2(30) NOT NULL,
	-- 키 이름 : 소리가 매칭되는 키 이름
	key_name varchar2(3) NOT NULL,
	-- 소리 경로 : 소리 저장 경로
	sou_path varchar2(500) NOT NULL,
	PRIMARY KEY (key_number)
);


-- like_click
CREATE TABLE like_click
(
	-- 좋아요 번호 : 좋아요 고유 번호 시퀀스
	like_number number NOT NULL,
	-- 좋아요를 누른 회원 번호 : 좋아요를 누른 회원의 회원 번호
	cust_number number NOT NULL,
	-- 좋아요가 눌린 회원 번호 : 좋아요가 눌린 게시물을 작성한 회원의 회원 번호
	target_number number NOT NULL,
	-- 게시물 고유번호 : 게시판의 고유 번호 시퀀스
	post_number number NOT NULL,
	-- 좋아요 타입 : 0. 좋아요 안함, 1.좋아요 누름
	likt_type nchar DEFAULT '0' NOT NULL,
	PRIMARY KEY (like_number)
);


-- music_library
CREATE TABLE Music_Library
(
	-- 음악 번호 : 음악의 고유 번호 시퀀스
	mus_number number NOT NULL,
	-- 회원번호 : 작곡한 회원의 고유번호. 세션
	cust_number number NOT NULL,
	-- 음악 이름 : 음악 이름
	mus_title varchar2(50) NOT NULL,
	-- 음악의 저장 이름 : 해당 음악의 저장 이름
	mus_saved varchar2(500) NOT NULL,
	-- 작곡 일시 : 작곡한 일시
	mus_date date NOT NULL,
	PRIMARY KEY (mus_number)
);


-- Notification2
CREATE TABLE Notification2
(
	-- 알림 번호 : 알림 고유 번호 시퀀스
	not_number number NOT NULL,
	-- 알림 받는 회원 번호 : 알림을 받는 회원 번호
	not_cust_number number,
	-- 알림을 받게 액션을 취한 회원의 번호 : 해당 알림을 받게끔 댓글, 쪽지, 좋아요 등의 액션을 취한 회원의 번호
	not_sender_number number,
	-- 알림 종류 : comment, letter, like, follow 등의 알림 타입
	not_type varchar2(30) NOT NULL,
	-- 알림 링크 주소 : 알림 클릭시 이동할 링크 주소
	not_content varchar2(100) NOT NULL,
	-- 알림 발생 일시 : 알림 발생한 일시
	not_time date DEFAULT sysdate,
	-- 알림 확인 여부 : 알림을 확인했는지 여부
	not_check number DEFAULT 0,
	PRIMARY KEY (not_number)
);


-- Part_music
CREATE TABLE Part_music
(
	-- part_make 고유 번호 : 파트 메이크 고유 번호
	make_number number NOT NULL,
	-- 회원 고유 번호 : 작곡중인 회원 고유 번호
	cust_number number NOT NULL,
	-- 파트 번호 : 해당 곡의 몇번째 파트인가
	part_number number NOT NULL,
	-- 프레이즈 번호 : 몇번째 프레이즈인가
	phrase_number number NOT NULL,
	-- 키세트 이름 : 프레이즈에 해당하는 키세트 이름
	key_board varchar2(30),
	-- 프레이즈 저장 : 프레이즈에 연주한 부분 파일로 저장
	phrase_saved varchar2(500),
	PRIMARY KEY (make_number)
);


-- post
CREATE TABLE Post
(
	-- 게시물 고유번호 : 게시판의 고유 번호 시퀀스
	post_number number NOT NULL,
	-- 해당 게시물의 음악 번호 : 게시물에 올라가는 음악의 고유 번호
	mus_number number NOT NULL,
	-- 게시물 작성한 회원번호 : 게시물을 작성한 회원의 회원 번호. 세션으로 등록
	cust_number number NOT NULL,
	-- 음악 이름 : 음악 이름이자 게시물 제목
	mus_title varchar2(50) NOT NULL,
	-- 게시물 내용 : 게시물 내용
	post_content varchar2(3000),
	-- 게시물 작성 일시 : 게시물 작성 일시
	post_date date NOT NULL,
	-- 게시물 댓글 수 : 게시물에 달린 댓글 수
	post_reply number DEFAULT 0 NOT NULL,
	-- 게시물 좋아요 회수 : 게시물의 좋아요 회수
	post_like number DEFAULT 0 NOT NULL,
	-- 게시물 플레이 회수 : 해당 게시물의 플레이 회수
	post_play number DEFAULT 0 NOT NULL,
	-- 게시물 이미지의 원래 이름 : 게시물에 등록한 이미지의 원래 이름
	post_original varchar2(500),
	-- 게시물 이미지 저장 이름 : 게시물에 등록된 이미지의 저장 이름
	post_saved varchar2(500),
	-- post_nickname
	post_nickname varchar2(20),
	PRIMARY KEY (post_number)
);


-- post_tag
CREATE TABLE Post_tag
(
	-- post_tag 번호 : 게시물당 태그의 고유 번호 시퀀스
	pt_number number NOT NULL,
	-- 태그 번호 : 태그 고유번호 시퀀스
	tag_number number NOT NULL,
	-- 게시물 고유번호 : 게시판의 고유 번호 시퀀스
	post_number number NOT NULL,
	PRIMARY KEY (pt_number)
);


-- reply
CREATE TABLE Reply
(
	-- 댓글 번호 : 댓글 고유 번호 시퀀스
	rep_number number NOT NULL,
	-- 게시물 고유번호 : 댓글이 달린 게시판의 고유 번호
	post_number number NOT NULL,
	-- 회원번호 : 댓글을 입력한 회원의 고유번호. 
	cust_number number NOT NULL,
	-- 댓글 내용 : 댓글 내용
	rep_content varchar2(1000) NOT NULL,
	-- 댓글 입력한 회원 닉네임 : 댓글을 입력한 회원의 닉네임
	rep_nickname varchar2(30) NOT NULL,
	-- 댓글 입력한 회원 주소 : 댓글을 입력한 회원의 프로필 주소
	rep_url varchar2(500) NOT NULL,
	-- 댓글 입력 일시 : 댓글 입력 일시
	rep_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (rep_number)
);


-- searchword
CREATE TABLE searchword
(
	-- search_number
	search_number number NOT NULL,
	-- search_word
	search_word varchar2(50) NOT NULL,
	-- hitcount
	hitcount number DEFAULT 0,
	PRIMARY KEY (search_number)
);


-- sound_library
CREATE TABLE Sound_Library
(
	-- 소리 번호 : 등록된 소리의 고유 번호 시퀀스
	sou_number number NOT NULL,
	-- 소리를 등록한 회원 번호 : 소리를 등록한 회원의 회원 번호. 세션
	cust_number number,
	-- 소리 종류 : 피아노, 드럼, 기타, 사용자 정의 등
	sou_type varchar2(30) NOT NULL,
	-- 소리 이름 : 녹음 소리 원래 이름
	sou_name varchar2(30) NOT NULL,
	-- 소리 저장 이름 : 녹음 소리 저장 이름
	sou_saved varchar2(500) NOT NULL,
	PRIMARY KEY (sou_number)
);


-- tag
CREATE TABLE Tag
(
	-- 태그 번호 : 태그 고유번호 시퀀스
	tag_number number NOT NULL,
	-- 태그 이름 : 태그 이름
	tag_name varchar2(50) NOT NULL,
	PRIMARY KEY (tag_number)
);


-- temp
CREATE TABLE Temp
(
	-- temp 고유 번호 : temp 고유 번호
	temp_number number NOT NULL,
	-- 작곡중인 회원 번호 : 작곡중인 회원 번호
	cust_number number NOT NULL,
	-- 임시곡 제목 : 만들고 있는 곡의 제목 (불러오기용)
	temp_title varchar2(50),
	-- bpm : bpm
	temp_bpm number NOT NULL,
	-- 임시저장 : 임시 믹싱한 곡 저장
	temp_saved varchar2(500),
	PRIMARY KEY (temp_number)
);



/* Create Foreign Keys */

ALTER TABLE Follow
	ADD FOREIGN KEY (follower_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE Follow
	ADD FOREIGN KEY (follow_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE like_click
	ADD FOREIGN KEY (target_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE like_click
	ADD FOREIGN KEY (cust_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE Notification2
	ADD FOREIGN KEY (not_cust_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE Notification2
	ADD FOREIGN KEY (not_sender_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE Reply
	ADD FOREIGN KEY (cust_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE Post
	ADD FOREIGN KEY (mus_number)
	REFERENCES Music_Library (mus_number)
;


ALTER TABLE like_click
	ADD FOREIGN KEY (post_number)
	REFERENCES Post (post_number)
;


ALTER TABLE Post_tag
	ADD FOREIGN KEY (post_number)
	REFERENCES Post (post_number)
;


ALTER TABLE Reply
	ADD FOREIGN KEY (post_number)
	REFERENCES Post (post_number)
;


ALTER TABLE Post_tag
	ADD FOREIGN KEY (tag_number)
	REFERENCES Tag (tag_number)
;



