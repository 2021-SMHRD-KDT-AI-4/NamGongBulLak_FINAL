DROP TABLE D_Member;

CREATE TABLE D_Member(
    ID VARCHAR2(20), 
    PW             VARCHAR2(20), 
    Mileage        NUMBER, 
    Nickname       VARCHAR2(20), 
    Premium        NUMBER, 
    Country        VARCHAR2(20), 
--    Share_Agree    VARCHAR2(20), 
    CONSTRAINT Member_ID_PK PRIMARY KEY(ID)
);

SELECT * FROM D_MEMBER

INSERT INTO D_MEMBER values('ID2', '1234', 0, '닉네임2', 0, 'Korea.jpg')

-------------------------------------------------------------------------- 1. D_Member

DROP TABLE Dance_Info;
DROP SEQUENCE Song_Seq_seq;

CREATE TABLE Dance_Info(
	Song_Title         VARCHAR2(20), 
    Song_Singer        VARCHAR2(20), 
    Song_File_Name     VARCHAR2(20), 
    Song_Price         NUMBER, 
    Elbum_File_Name    VARCHAR2(20), 
    Elbum_Name         VARCHAR2(20), 
    Release_Date       VARCHAR2(20), 
    Song_Seq           NUMBER , 
    CONSTRAINT Dance_Info_Song_Seq_PK PRIMARY KEY (Song_Seq)	
);

CREATE sequence Song_Seq_seq start with 1 increment by 1;

INSERT INTO Dance_Info values('Butter2', 'BTS2', 'Butter2.mp4', 500, 'Elb_Butte2r.jpg', 'Elb_Butter2', '2021-07-01', Song_Seq_seq.nextval)

SELECT * FROM Dance_Info

-------------------------------------------------------------------------- 2. Dance_Info

DROP TABLE User_Dance_Info;
DROP SEQUENCE Play_Seq_seq;

CREATE TABLE User_Dance_Info(
	Play_Seq          NUMBER, 
    ID                VARCHAR2(20), 
    Premium           NUMBER, 
    Play_Date         DATE, 
    Song_title        VARCHAR2(20), 
    Song_singer       VARCHAR2(20), 
    Accuracy          FLOAT (24), 
    User_File_Name    VARCHAR2(20), 
    Season            NUMBER, 
    Song_Seq          NUMBER, 
    CONSTRAINT User_Dance_Info PRIMARY KEY (Play_Seq),
    CONSTRAINT User_Dance_Info_Song_Seq_FK FOREIGN KEY (Song_Seq) REFERENCES Dance_Info (Song_Seq)
);

CREATE sequence Play_Seq_seq start with 1 increment by 1;

INSERT INTO Dance_Info values(Play_Seq_seq.nextval, 'ID1', 1, sysdate, 'Butterrrr', 'BTSSSss', 87.26, 'record_butter_1.mp4',  ,Song_Seq_seq.nextval)

SELECT * FROM User_Dance_Info;

-------------------------------------------------------------------------- 3. User_Dance_Info

DROP TABLE Dance_Share_Board;
DROP SEQUENCE Board_Seq_seq;

CREATE TABLE Dance_Share_Board(
	Board_Seq        NUMBER, 
    Write_Title      VARCHAR2(20), 
    Write_Content    VARCHAR2(1000), 
    Like_cnt         NUMBER, 
    View_Count       NUMBER, 
    Play_Seq         NUMBER, 
    CONSTRAINT Dance_Share_Board PRIMARY KEY (Board_Seq),
    CONSTRAINT Dance_Share_Board_Song_Seq_FK FOREIGN KEY (Play_Seq) REFERENCES User_Dance_Info (Play_Seq)
);

CREATE sequence Board_Seq_seq start with 1 increment by 1;

SELECT * FROM Dance_Share_Board;

-------------------------------------------------------------------------- 4. Dance_Share_Board

DROP TABLE Product_Info;

CREATE TABLE Product_Info(
	P_Name         VARCHAR2(20), 
    P_File_Name    VARCHAR2(20), 
    P_Category     NUMBER, 
    CONSTRAINT Product_Info PRIMARY KEY (P_Name)
);

SELECT * FROM Product_Info;

-------------------------------------------------------------------------- 5. Product_Info

DROP TABLE Product_Buy_Info;
DROP SEQUENCE Buy_Seq_seq;

CREATE TABLE Product_Buy_Info(
	Buy_Seq	NUMBER,
	ID	VARCHAR2(20),
	P_Name VARCHAR2(20),
	CONSTRAINT Product_Buy_Info PRIMARY KEY (Buy_Seq),
	CONSTRAINT Product_Buy_Info_ID_FK FOREIGN KEY (ID) REFERENCES D_Member (ID),
	CONSTRAINT Product_Buy_Info_P_Name_FK FOREIGN KEY (P_Name) REFERENCES Product_Info (P_Name)
);

CREATE sequence Buy_Seq_seq start with 1 increment by 1;

SELECT * FROM Product_Buy_Info;

-------------------------------------------------------------------------- 6. Product_Buy_Info

DROP TABLE Emblem_Info;

CREATE TABLE Emblem_Info(
    Emblem_File_Name    VARCHAR2(20), 
    Emblem_Name         VARCHAR2(20), 
    CONSTRAINT Emblem_Info PRIMARY KEY (Emblem_Name)
);

SELECT * FROM Emblem_Info;

-------------------------------------------------------------------------- 7. Emblem_Info

DROP TABLE Emblem;

CREATE TABLE Emblem(
    ID             VARCHAR2(20), 
    Emblem_Name    VARCHAR2(20),
    CONSTRAINT Emblem_Emblem_Name_FK FOREIGN KEY (Emblem_Name) REFERENCES Emblem_Info (Emblem_Name)
);

SELECT * FROM Emblem;

-------------------------------------------------------------------------- 8. Emblem

DROP TABLE Board_Comment;
DROP SEQUENCE Comment_Seq_seq;

CREATE TABLE Board_Comment(
    Comment_Seq    NUMBER, 
    ID             VARCHAR2(20), 
    Comments       VARCHAR2(50), 
    Board_Seq      NUMBER,
    CONSTRAINT Board_Comment PRIMARY KEY (Comment_Seq),
    CONSTRAINT Board_Comment_Board_Seq_FK FOREIGN KEY (Board_Seq) REFERENCES Dance_Share_Board (Board_Seq)
);

CREATE sequence Comment_Seq_seq start with 1 increment by 1;

SELECT * FROM Board_Comment;

-------------------------------------------------------------------------- 9. Comment

DROP TABLE Tutorial;

CREATE TABLE Tutorial(
	ID                   VARCHAR2(20), 
    Tutorial_URL         VARCHAR2(20), 
    Tutorial_Accuracy    VARCHAR2(20),
    CONSTRAINT Tutorial_ID_FK FOREIGN KEY (ID) REFERENCES D_Member (ID)
);

SELECT * FROM Tutorial;

-------------------------------------------------------------------------- 10. Tutorial

ALTER TABLE danceboards ADD(article_date DATE);
ALTER TABLE danceboards ADD(id VARCHAR2(120));
ALTER TABLE danceboards ADD(play_seq INT);
ALTER TABLE danceboards ADD(upload_filename VARCHAR2(120));
ALTER TABLE comments ADD(comment_date DATE);
ALTER TABLE members ADD(profile_img VARCHAR2(120));
ALTER TABLE danceinfos ADD(difficulty VARCHAR2(120));
ALTER TABLE mydanceinfos ADD(article_seq NUMBER);

ALTER TABLE COMMENTS
ADD CONSTRAINT FK_COMMENTS_ID_MEMBERS FOREIGN KEY (ID)
REFERENCES MEMBERS (ID);

ALTER TABLE DANCEBOARDS
ADD CONSTRAINT FK_DANCEBOARDS_ID_MEMBERS FOREIGN KEY (ID)
REFERENCES MEMBERS (ID);

ALTER TABLE DANCEBOARDS
ADD CONSTRAINT FK_DANCEBOARDS_ID_MYDANCEINFOS FOREIGN KEY (PLAY_SEQ)
REFERENCES MYDANCEINFOS (PLAY_SEQ);

ALTER TABLE EMBLEMS
ADD CONSTRAINT FK_EMBLEMS_ID_MEMBERS FOREIGN KEY (ID)
REFERENCES MEMBERS (ID);


SELECT * FROM members;
SELECT * FROM danceboards;
SELECT * FROM comments;
SELECT * FROM danceinfos;
SELECT * FROM emblems;
SELECT * FROM embleminfos;
SELECT * FROM mydanceinfos;

DELETE FROM DANCEBOARDS;
DELETE FROM comments;

--board_view SQL
SELECT
a.subject 게시물제목, a.content 게시물내용, a.like_count 좋아요, a.view_count 조회수, a.article_date 작성일,
b.song_title 노래제목, b.song_singer 가수, b.user_filename 리플레이영상,
c.song_file_name 앨범이미지,
d.nickname 닉네임, d.profile_img 프로필이미지,
e.comments 댓글내용, e.comment_date 댓글작성일, d2.nickname
FROM danceboards a, mydanceinfos b, danceinfos c, members d, members d2, comments e
WHERE a.article_seq = 3
    AND a.play_seq = b.play_seq
    AND b.song_seq = c.song_seq
    AND a.id = d.id	
    AND a.article_seq = e.article_seq
    AND d2.id = e.id
;

-- DanceBoardDAO board_view
SELECT a.article_seq, b.album_filename, b.song_title, b.song_singer, c.profile_img, a.subject, c.nickname, a.like_count, a.view_count, a.article_date
FROM danceboards a, danceinfos b, members c

SELECT a.article_seq, d.album_filename, b.song_title, b.song_singer, c.profile_img, a.subject, c.nickname, a.like_count, a.view_count, a.article_date, b.user_filename
FROM danceboards a, mydanceinfos b, members c, danceinfos d
WHERE b.article_seq = a.article_seq
	AND c.id = a.id
;

-- DanceBoardDAO board_view 중복제거 최종!!!
SELECT DISTINCT a.article_seq, d.album_filename, b.song_title, b.song_singer, c.profile_img, a.subject, c.nickname, a.like_count, a.view_count, a.article_date, b.user_filename
FROM danceboards a, mydanceinfos b, members c, danceinfos d
WHERE b.article_seq = a.article_seq
	AND c.id = a.id
    AND d.song_seq = b.song_seq
ORDER BY a.article_seq
;

-- DanceBoardDAO board_write_view
SELECT user_filename, play_date, song_title, song_singer, user_accuracy
FROM MYDANCEINFOS
WHERE id = 'ID 01';

-- DanceBoardDAO board_write
SELECT id, user_filename, play_date, song_title, song_singer, user_accuracy FROM MYDANCEINFOS;

-- 
SELECT a.emblem_name 엠블럼이름, b.id 사용자아이디, b.emblem_code 엠블럼코드, b.user_ecode 사용자보유엠블럼코드 
FROM embleminfos a, emblems b
WHERE a.emblem_code = b.emblem_code
;

-- MyDanceinfoDAO replay_view
SELECT a.user_filename, a.song_title, a.song_singer, a.user_accuracy, a.play_seq, a.id, a.song_seq, b.song_seq, b.difficulty
FROM mydanceinfos a, danceinfos b
WHERE a.song_seq = b.song_seq
;

--
--SELECT a.subject, a.content, a.like_count, a.view_count, a.article_date, b.song_title, b.song_singer, b.user_filename, c.song_file_name, d.nickname, d.profile_img, e.comments, e.comment_date, d2.nickname 
--FROM danceboards a, mydanceinfos b, danceinfos c, members d, members d2, comments e 
--WHERE a.article_seq = ? 
--AND a.play_seq = b.play_seq 
--AND b.song_seq = c.song_seq 
--AND a.id = d.id 
--AND a.article_seq = e.article_seq 
--AND d2.id = e.id

--SELECT a.subject, a.content, a.like_count, a.view_count, a.article_date, b.song_title, b.song_singer, b.user_filename, c.song_file_name, d.nickname, d.profile_img, e.comments, e.comment_date, d2.nickname FROM danceboards a, mydanceinfos b, danceinfos c, members d, members d2, comments e WHERE a.article_seq = 9 AND a.play_seq = b.play_seq

SELECT DISTINCT a.article_seq, d.album_filename, b.song_title, b.song_singer, c.profile_img, a.subject, c.nickname, a.like_count, a.view_count, a.article_date, b.user_filename
FROM danceboards a, mydanceinfos b, members c, danceinfos d 
WHERE b.id = c.id
AND b.id = a.id
AND b.song_seq = d.song_seq
ORDER BY a.article_seq


-- showOne
SELECT c.album_filename, c.album_title, a.id, a.article_seq, a.subject, a.content, a.like_count, a.view_count, a.article_date, b.song_title, b.song_singer, b.user_filename,c.song_file_name, d.nickname, d.profile_img, e.comments, e.comment_date, d2.nickname
				FROM danceboards a, mydanceinfos b, danceinfos c, members d, members d2, comments e
				WHERE  a.play_seq = b.play_seq
				AND b.song_seq = c.song_seq
				AND a.id = d.id
				AND a.article_seq = e.article_seq
				AND d2.id = e.id
				AND a.article_seq = 3
				
SELECT DISTINCT c.album_filename, c.album_title, a.id, a.article_seq, a.subject, a.content, a.like_count, a.view_count, a.article_date, b.song_title, b.song_singer, b.user_filename,c.song_file_name, d.nickname, d.profile_img, e.comments, e.comment_date, d2.nickname
				FROM danceboards a, mydanceinfos b, danceinfos c, members d, members d2, comments e
				WHERE a.article_seq = b.article_seq
				AND a.id = d.id
				AND a.play_seq = b.play_seq
				AND b.song_seq = c.song_seq
				
select album_filename, song_title, song_singer, song_seq, difficulty from danceinfos order by song_title desc;
