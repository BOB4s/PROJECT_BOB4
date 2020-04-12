
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
DROP TRIGGER TRI_Notification_not_number;
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

DROP TABLE Notification CASCADE CONSTRAINTS;
DROP TABLE Follow CASCADE CONSTRAINTS;
DROP TABLE letter CASCADE CONSTRAINTS;
DROP TABLE like_click CASCADE CONSTRAINTS;
DROP TABLE Reply CASCADE CONSTRAINTS;
DROP TABLE Customer CASCADE CONSTRAINTS;
DROP TABLE Temp CASCADE CONSTRAINTS;
DROP TABLE Key_Sound CASCADE CONSTRAINTS;
DROP TABLE Post_tag CASCADE CONSTRAINTS;
DROP TABLE Post CASCADE CONSTRAINTS;
DROP TABLE Music_Library CASCADE CONSTRAINTS;
DROP TABLE Sound_Library CASCADE CONSTRAINTS;
DROP TABLE Tag CASCADE CONSTRAINTS;



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
DROP SEQUENCE SEQ_Notification_not_number;
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
CREATE SEQUENCE SEQ_Notification_not_number INCREMENT BY 1 START WITH 1;
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

CREATE TABLE Customer
(
	-- 회원의 고유번호. 회원번호 시퀀스 사용 예정
	cust_number number NOT NULL,
	-- 로그인할때의 회원 아이디
	cust_id varchar2(30) NOT NULL UNIQUE,
	-- 로그인할때의 회원 비밀번호
	cust_password varchar2(30) NOT NULL,
	-- 비밀번호 찾거나 인증을 위한 회원 이메일
	cust_email varchar2(50) NOT NULL,
	-- 사이트 내에서 회원이 사용할 닉네임
	cust_nickname varchar2(20) NOT NULL UNIQUE,
	-- 회원의 개인 프로필에 들어갈 자기소개 내용
	cust_introduce varchar2(1000),
	-- 회원의 프로필에 등록한 사진의 원본 파일 이름
	cust_photo_original varchar2(500),
	-- 회원 프로필 사진이 저장되고 나서의 사진 이름
	cust_photo_saved varchar2(500),
	-- 회원가입 인증때 넘어오는 키
	cust_key varchar2(80),
	PRIMARY KEY (cust_number)
);


CREATE TABLE Follow
(
	-- 팔로우 테이블의 고유 넘버. 시퀀스.
	fol_number number NOT NULL,
	-- 팔로워의 회원 번호. Member table 참조
	follower_number number NOT NULL,
	-- 팔로우의 회원 번호. member 테이블 참조
	follow_number number NOT NULL,
	PRIMARY KEY (fol_number)
);


CREATE TABLE Key_Sound
(
	-- 해당 테이블의 고유 번호
	key_number number NOT NULL,
	-- 해당 키를 지정하는 회원 번호
	cust_number number,
	-- 사용자 정의의 전체 키보드 이름
	key_board varchar2(30) NOT NULL,
	-- 등록된 소리의 고유 번호 시퀀스
	sou_number number NOT NULL,
	-- 키에 매칭되는 소리 이름
	sou_name varchar2(30) NOT NULL,
	-- 소리가 매칭되는 키 이름
	key_name varchar2(2) NOT NULL,
	PRIMARY KEY (key_number)
);


CREATE TABLE letter
(
	-- 쪽지의 고유 번호 시퀀스
	let_number number NOT NULL,
	-- 쪽지를 보낸 회원 번호. member 참조
	send_number number NOT NULL,
	-- 쪽지를 받은 회원 번호. member 참조
	recv_number number NOT NULL,
	-- 받은 쪽지 제목
	let_title varchar2(50) NOT NULL,
	-- 쪽지 내용
	let_content varchar2(1000) NOT NULL,
	-- 쪽지를 읽었는지 여부. 읽으면 1
	recv_check nchar DEFAULT '0' NOT NULL,
	-- 착,발신 날짜
	let_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (let_number)
);


CREATE TABLE like_click
(
	-- 좋아요 고유 번호 시퀀스
	like_number number NOT NULL,
	-- 좋아요를 누른 회원의 회원 번호
	cust_number number NOT NULL,
	-- 좋아요가 눌린 게시물을 작성한 회원의 회원 번호
	target_number number NOT NULL,
	-- 게시판의 고유 번호 시퀀스
	post_number number NOT NULL,
	-- 0. 좋아요 안함, 1.좋아요 누름
	likt_type nchar DEFAULT '0' NOT NULL,
	PRIMARY KEY (like_number)
);


CREATE TABLE Music_Library
(
	-- 음악의 고유 번호 시퀀스
	mus_number number NOT NULL,
	-- 작곡한 회원의 고유번호. 세션
	cust_number number NOT NULL,
	-- 음악 이름
	mus_title varchar2(50) NOT NULL,
	-- 음악의 총 시간
	mus_time varchar2(10) NOT NULL,
	-- 해당 음악의 저장 이름
	mus_saved varchar2(500) NOT NULL,
	-- 작곡한 일시
	mus_date date NOT NULL,
	PRIMARY KEY (mus_number)
);


CREATE TABLE Notification
(
	-- 알림 고유 번호 시퀀스
	not_number number NOT NULL,
	-- 알림을 받는 회원 번호
	recv_number number NOT NULL,
	-- 해당 알림을 받게끔 댓글, 쪽지, 좋아요 등의 액션을 취한 회원의 번호
	send_number number NOT NULL,
	-- 알림이 있게 한 팔로우 테이블의 고유 넘버. 시퀀스.
	fol_number number,
	-- 알림이 있게 한 쪽지의 고유 번호 시퀀스
	let_number number,
	-- 알림이 있게 한 댓글 고유 번호 시퀀스
	rep_number number,
	-- 알림이 있게 한 좋아요 고유 번호 시퀀스
	like_number number,
	-- comment, letter, like, follow 등의 알림 타입
	not_type varchar2(30) NOT NULL,
	-- 알림 클릭시 이동할 링크 주소
	not_url varchar2(500) NOT NULL,
	-- 알림 발생한 일시
	not_time date DEFAULT sysdate NOT NULL,
	-- 알림을 확인했는지 여부
	not_check nchar DEFAULT '0',
	PRIMARY KEY (not_number)
);


CREATE TABLE Post
(
	-- 게시판의 고유 번호 시퀀스
	post_number number NOT NULL,
	-- 게시물에 올라가는 음악의 고유 번호
	mus_number number NOT NULL,
	-- 게시물을 작성한 회원의 회원 번호. 세션으로 등록
	cust_number number NOT NULL,
	-- 음악 이름이자 게시물 제목
	mus_title varchar2(50) NOT NULL,
	-- 음악의 총 시간
	mus_time varchar2(10) NOT NULL,
	-- 게시물 내용
	post_content varchar2(3000),
	-- 작성자의 닉네임
	post_nickname varchar2(20) NOT NULL,
	-- 작성자의 프로필 주소
	post_url varchar2(500) NOT NULL,
	-- 게시물 작성 일시
	post_date date NOT NULL,
	-- 게시물에 달린 댓글 수
	post_reply number DEFAULT 0 NOT NULL,
	-- 게시물의 좋아요 회수
	post_like number DEFAULT 0 NOT NULL,
	-- 해당 게시물의 플레이 회수
	post_play number DEFAULT 0 NOT NULL,
	-- 게시물에 등록한 이미지의 원래 이름
	post_original varchar2(500),
	-- 게시물에 등록된 이미지의 저장 이름
	post_saved varchar2(500),
	PRIMARY KEY (post_number)
);


CREATE TABLE Post_tag
(
	-- 게시물당 태그의 고유 번호 시퀀스
	pt_number number NOT NULL,
	-- 태그 고유번호 시퀀스
	tag_number number NOT NULL,
	-- 게시판의 고유 번호 시퀀스
	post_number number NOT NULL,
	PRIMARY KEY (pt_number)
);


CREATE TABLE Reply
(
	-- 댓글 고유 번호 시퀀스
	rep_number number NOT NULL,
	-- 댓글이 달린 게시판의 고유 번호
	post_number number NOT NULL,
	-- 댓글을 입력한 회원의 고유번호. 
	cust_number number NOT NULL,
	-- 댓글 내용
	rep_content varchar2(1000) NOT NULL,
	-- 댓글을 입력한 회원의 닉네임
	rep_nickname varchar2(30) NOT NULL,
	-- 댓글을 입력한 회원의 프로필 주소
	rep_url varchar2(500) NOT NULL,
	-- 댓글 입력 일시
	rep_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (rep_number)
);


CREATE TABLE Sound_Library
(
	-- 등록된 소리의 고유 번호 시퀀스
	sou_number number NOT NULL,
	-- 소리를 등록한 회원의 회원 번호. 세션
	cust_number number,
	-- 피아노, 드럼, 기타, 사용자 정의 등
	sou_type varchar2(30) NOT NULL,
	-- 녹음 소리 원래 이름
	sou_name varchar2(30) NOT NULL,
	-- 녹음 소리 저장 이름
	sou_saved varchar2(500) NOT NULL,
	PRIMARY KEY (sou_number)
);


CREATE TABLE Tag
(
	-- 태그 고유번호 시퀀스
	tag_number number NOT NULL,
	-- 태그 이름
	tag_name varchar2(50) NOT NULL,
	PRIMARY KEY (tag_number)
);


CREATE TABLE Temp
(
	-- temp 고유 번호
	temp_number number NOT NULL,
	-- 작곡중인 회원 번호
	cust_number number NOT NULL,
	-- 전체 곡 중에서 몇 번째 트랩인지를 나타내주는 번호
	trap_number number DEFAULT 1 NOT NULL,
	-- 해당 테이블의 고유 번호
	key_number number NOT NULL,
	-- 현재 트랩에서 어떠한 키-소리 타입을 이용하는지
	key_board varchar2(30),
	-- 만들고 있는 곡의 제목 (불러오기용)
	temp_title varchar2(50) NOT NULL,
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


ALTER TABLE letter
	ADD FOREIGN KEY (send_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE letter
	ADD FOREIGN KEY (recv_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE like_click
	ADD FOREIGN KEY (cust_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE like_click
	ADD FOREIGN KEY (target_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE Notification
	ADD FOREIGN KEY (send_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE Notification
	ADD FOREIGN KEY (recv_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE Reply
	ADD FOREIGN KEY (cust_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE Notification
	ADD FOREIGN KEY (fol_number)
	REFERENCES Follow (fol_number)
;


ALTER TABLE Temp
	ADD FOREIGN KEY (key_number)
	REFERENCES Key_Sound (key_number)
;


ALTER TABLE Notification
	ADD FOREIGN KEY (let_number)
	REFERENCES letter (let_number)
;


ALTER TABLE Notification
	ADD FOREIGN KEY (like_number)
	REFERENCES like_click (like_number)
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


ALTER TABLE Notification
	ADD FOREIGN KEY (rep_number)
	REFERENCES Reply (rep_number)
;


ALTER TABLE Key_Sound
	ADD FOREIGN KEY (sou_number)
	REFERENCES Sound_Library (sou_number)
;


ALTER TABLE Post_tag
	ADD FOREIGN KEY (tag_number)
	REFERENCES Tag (tag_number)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_Comment_com_number BEFORE INSERT ON Comment
FOR EACH ROW
BEGIN
	SELECT SEQ_Comment_com_number.nextval
	INTO :new.com_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Customer_cust_number BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
	SELECT SEQ_Customer_cust_number.nextval
	INTO :new.cust_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Follow_fol_number BEFORE INSERT ON Follow
FOR EACH ROW
BEGIN
	SELECT SEQ_Follow_fol_number.nextval
	INTO :new.fol_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Key_Sound_key_number BEFORE INSERT ON Key_Sound
FOR EACH ROW
BEGIN
	SELECT SEQ_Key_Sound_key_number.nextval
	INTO :new.key_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Letter_let_number BEFORE INSERT ON Letter
FOR EACH ROW
BEGIN
	SELECT SEQ_Letter_let_number.nextval
	INTO :new.let_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_like_click_like_number BEFORE INSERT ON like_click
FOR EACH ROW
BEGIN
	SELECT SEQ_like_click_like_number.nextval
	INTO :new.like_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Like_like_number BEFORE INSERT ON Like
FOR EACH ROW
BEGIN
	SELECT SEQ_Like_like_number.nextval
	INTO :new.like_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Member_mem_number BEFORE INSERT ON Member
FOR EACH ROW
BEGIN
	SELECT SEQ_Member_mem_number.nextval
	INTO :new.mem_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Music_Library_mus_number BEFORE INSERT ON Music_Library
FOR EACH ROW
BEGIN
	SELECT SEQ_Music_Library_mus_number.nextval
	INTO :new.mus_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Notification_not_number BEFORE INSERT ON Notification
FOR EACH ROW
BEGIN
	SELECT SEQ_Notification_not_number.nextval
	INTO :new.not_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Post_post_number BEFORE INSERT ON Post
FOR EACH ROW
BEGIN
	SELECT SEQ_Post_post_number.nextval
	INTO :new.post_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Post_tag_pt_number BEFORE INSERT ON Post_tag
FOR EACH ROW
BEGIN
	SELECT SEQ_Post_tag_pt_number.nextval
	INTO :new.pt_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_recv_letter_let_number BEFORE INSERT ON recv_letter
FOR EACH ROW
BEGIN
	SELECT SEQ_recv_letter_let_number.nextval
	INTO :new.let_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Reply_rep_number BEFORE INSERT ON Reply
FOR EACH ROW
BEGIN
	SELECT SEQ_Reply_rep_number.nextval
	INTO :new.rep_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_send_letter_let_number BEFORE INSERT ON send_letter
FOR EACH ROW
BEGIN
	SELECT SEQ_send_letter_let_number.nextval
	INTO :new.let_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Sound_Library_sou_number BEFORE INSERT ON Sound_Library
FOR EACH ROW
BEGIN
	SELECT SEQ_Sound_Library_sou_number.nextval
	INTO :new.sou_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Sound_mike_mike_number BEFORE INSERT ON Sound_mike
FOR EACH ROW
BEGIN
	SELECT SEQ_Sound_mike_mike_number.nextval
	INTO :new.mike_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Tag_tag_number BEFORE INSERT ON Tag
FOR EACH ROW
BEGIN
	SELECT SEQ_Tag_tag_number.nextval
	INTO :new.tag_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Temporary_temp_number BEFORE INSERT ON Temporary
FOR EACH ROW
BEGIN
	SELECT SEQ_Temporary_temp_number.nextval
	INTO :new.temp_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Temp_temp_number BEFORE INSERT ON Temp
FOR EACH ROW
BEGIN
	SELECT SEQ_Temp_temp_number.nextval
	INTO :new.temp_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_User_user_number BEFORE INSERT ON User
FOR EACH ROW
BEGIN
	SELECT SEQ_User_user_number.nextval
	INTO :new.user_number
	FROM dual;
END;

/




/* Comments */

COMMENT ON COLUMN Customer.cust_number IS '회원의 고유번호. 회원번호 시퀀스 사용 예정';
COMMENT ON COLUMN Customer.cust_id IS '로그인할때의 회원 아이디';
COMMENT ON COLUMN Customer.cust_password IS '로그인할때의 회원 비밀번호';
COMMENT ON COLUMN Customer.cust_email IS '비밀번호 찾거나 인증을 위한 회원 이메일';
COMMENT ON COLUMN Customer.cust_nickname IS '사이트 내에서 회원이 사용할 닉네임';
COMMENT ON COLUMN Customer.cust_introduce IS '회원의 개인 프로필에 들어갈 자기소개 내용';
COMMENT ON COLUMN Customer.cust_photo_original IS '회원의 프로필에 등록한 사진의 원본 파일 이름';
COMMENT ON COLUMN Customer.cust_photo_saved IS '회원 프로필 사진이 저장되고 나서의 사진 이름';
COMMENT ON COLUMN Customer.cust_key IS '회원가입 인증때 넘어오는 키';
COMMENT ON COLUMN Follow.fol_number IS '팔로우 테이블의 고유 넘버. 시퀀스.';
COMMENT ON COLUMN Follow.follower_number IS '팔로워의 회원 번호. Member table 참조';
COMMENT ON COLUMN Follow.follow_number IS '팔로우의 회원 번호. member 테이블 참조';
COMMENT ON COLUMN Key_Sound.key_number IS '해당 테이블의 고유 번호';
COMMENT ON COLUMN Key_Sound.cust_number IS '해당 키를 지정하는 회원 번호';
COMMENT ON COLUMN Key_Sound.key_board IS '사용자 정의의 전체 키보드 이름';
COMMENT ON COLUMN Key_Sound.sou_number IS '등록된 소리의 고유 번호 시퀀스';
COMMENT ON COLUMN Key_Sound.sou_name IS '키에 매칭되는 소리 이름';
COMMENT ON COLUMN Key_Sound.key_name IS '소리가 매칭되는 키 이름';
COMMENT ON COLUMN letter.let_number IS '쪽지의 고유 번호 시퀀스';
COMMENT ON COLUMN letter.send_number IS '쪽지를 보낸 회원 번호. member 참조';
COMMENT ON COLUMN letter.recv_number IS '쪽지를 받은 회원 번호. member 참조';
COMMENT ON COLUMN letter.let_title IS '받은 쪽지 제목';
COMMENT ON COLUMN letter.let_content IS '쪽지 내용';
COMMENT ON COLUMN letter.recv_check IS '쪽지를 읽었는지 여부. 읽으면 1';
COMMENT ON COLUMN letter.let_date IS '착,발신 날짜';
COMMENT ON COLUMN like_click.like_number IS '좋아요 고유 번호 시퀀스';
COMMENT ON COLUMN like_click.cust_number IS '좋아요를 누른 회원의 회원 번호';
COMMENT ON COLUMN like_click.target_number IS '좋아요가 눌린 게시물을 작성한 회원의 회원 번호';
COMMENT ON COLUMN like_click.post_number IS '게시판의 고유 번호 시퀀스';
COMMENT ON COLUMN like_click.likt_type IS '0. 좋아요 안함, 1.좋아요 누름';
COMMENT ON COLUMN Music_Library.mus_number IS '음악의 고유 번호 시퀀스';
COMMENT ON COLUMN Music_Library.cust_number IS '작곡한 회원의 고유번호. 세션';
COMMENT ON COLUMN Music_Library.mus_title IS '음악 이름';
COMMENT ON COLUMN Music_Library.mus_time IS '음악의 총 시간';
COMMENT ON COLUMN Music_Library.mus_saved IS '해당 음악의 저장 이름';
COMMENT ON COLUMN Music_Library.mus_date IS '작곡한 일시';
COMMENT ON COLUMN Notification.not_number IS '알림 고유 번호 시퀀스';
COMMENT ON COLUMN Notification.recv_number IS '알림을 받는 회원 번호';
COMMENT ON COLUMN Notification.send_number IS '해당 알림을 받게끔 댓글, 쪽지, 좋아요 등의 액션을 취한 회원의 번호';
COMMENT ON COLUMN Notification.fol_number IS '알림이 있게 한 팔로우 테이블의 고유 넘버. 시퀀스.';
COMMENT ON COLUMN Notification.let_number IS '알림이 있게 한 쪽지의 고유 번호 시퀀스';
COMMENT ON COLUMN Notification.rep_number IS '알림이 있게 한 댓글 고유 번호 시퀀스';
COMMENT ON COLUMN Notification.like_number IS '알림이 있게 한 좋아요 고유 번호 시퀀스';
COMMENT ON COLUMN Notification.not_type IS 'comment, letter, like, follow 등의 알림 타입';
COMMENT ON COLUMN Notification.not_url IS '알림 클릭시 이동할 링크 주소';
COMMENT ON COLUMN Notification.not_time IS '알림 발생한 일시';
COMMENT ON COLUMN Notification.not_check IS '알림을 확인했는지 여부';
COMMENT ON COLUMN Post.post_number IS '게시판의 고유 번호 시퀀스';
COMMENT ON COLUMN Post.mus_number IS '게시물에 올라가는 음악의 고유 번호';
COMMENT ON COLUMN Post.cust_number IS '게시물을 작성한 회원의 회원 번호. 세션으로 등록';
COMMENT ON COLUMN Post.mus_title IS '음악 이름이자 게시물 제목';
COMMENT ON COLUMN Post.mus_time IS '음악의 총 시간';
COMMENT ON COLUMN Post.post_content IS '게시물 내용';
COMMENT ON COLUMN Post.post_nickname IS '작성자의 닉네임';
COMMENT ON COLUMN Post.post_url IS '작성자의 프로필 주소';
COMMENT ON COLUMN Post.post_date IS '게시물 작성 일시';
COMMENT ON COLUMN Post.post_reply IS '게시물에 달린 댓글 수';
COMMENT ON COLUMN Post.post_like IS '게시물의 좋아요 회수';
COMMENT ON COLUMN Post.post_play IS '해당 게시물의 플레이 회수';
COMMENT ON COLUMN Post.post_original IS '게시물에 등록한 이미지의 원래 이름';
COMMENT ON COLUMN Post.post_saved IS '게시물에 등록된 이미지의 저장 이름';
COMMENT ON COLUMN Post_tag.pt_number IS '게시물당 태그의 고유 번호 시퀀스';
COMMENT ON COLUMN Post_tag.tag_number IS '태그 고유번호 시퀀스';
COMMENT ON COLUMN Post_tag.post_number IS '게시판의 고유 번호 시퀀스';
COMMENT ON COLUMN Reply.rep_number IS '댓글 고유 번호 시퀀스';
COMMENT ON COLUMN Reply.post_number IS '댓글이 달린 게시판의 고유 번호';
COMMENT ON COLUMN Reply.cust_number IS '댓글을 입력한 회원의 고유번호. ';
COMMENT ON COLUMN Reply.rep_content IS '댓글 내용';
COMMENT ON COLUMN Reply.rep_nickname IS '댓글을 입력한 회원의 닉네임';
COMMENT ON COLUMN Reply.rep_url IS '댓글을 입력한 회원의 프로필 주소';
COMMENT ON COLUMN Reply.rep_date IS '댓글 입력 일시';
COMMENT ON COLUMN Sound_Library.sou_number IS '등록된 소리의 고유 번호 시퀀스';
COMMENT ON COLUMN Sound_Library.cust_number IS '소리를 등록한 회원의 회원 번호. 세션';
COMMENT ON COLUMN Sound_Library.sou_type IS '피아노, 드럼, 기타, 사용자 정의 등';
COMMENT ON COLUMN Sound_Library.sou_name IS '녹음 소리 원래 이름';
COMMENT ON COLUMN Sound_Library.sou_saved IS '녹음 소리 저장 이름';
COMMENT ON COLUMN Tag.tag_number IS '태그 고유번호 시퀀스';
COMMENT ON COLUMN Tag.tag_name IS '태그 이름';
COMMENT ON COLUMN Temp.temp_number IS 'temp 고유 번호';
COMMENT ON COLUMN Temp.cust_number IS '작곡중인 회원 번호';
COMMENT ON COLUMN Temp.trap_number IS '전체 곡 중에서 몇 번째 트랩인지를 나타내주는 번호';
COMMENT ON COLUMN Temp.key_number IS '해당 테이블의 고유 번호';
COMMENT ON COLUMN Temp.key_board IS '현재 트랩에서 어떠한 키-소리 타입을 이용하는지';
COMMENT ON COLUMN Temp.temp_title IS '만들고 있는 곡의 제목 (불러오기용)';



