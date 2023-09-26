-- 관리자 테이블, MASTER_INFO

CREATE SEQUENCE NEW_STORE_NUM;
INCREMENT BY 10
START WITH 10
MAXVALUE 500
MINVALUE 0
NOCYCLE
CACHE 2;

CREATE TABLE MASTER_INFO(
    BIZNUM          NUMBER(20)   PRIMARY KEY,
    STORE_NUM       NUMBER(10)   NOT NULL,
    MASTER_PW       VARCHAR2(20) NOT NULL,
    MASTER_STORE    VARCHAR2(20) NOT NULL,
    MASTER_NAME     VARCHAR2(20) NOT NULL,
    TOTALSALES      VARCHAR2(20) NULL
);

INSERT INTO MASTER_INFO VALUES(1234567890, NEW_STORE_NUM.NEXTVAL ,'sick!23', '한식대첩', '김한식', NULL);
INSERT INTO MASTER_INFO VALUES(1234567888, NEW_STORE_NUM.NEXTVAL, 'maraM4%', '마라왕', '남마라', NULL);
INSERT INTO MASTER_INFO VALUES(1234567777, NEW_STORE_NUM.NEXTVAL, 'susi432!', '일등스시', '고연어', NULL);
INSERT INTO MASTER_INFO VALUES(1234567676, NEW_STORE_NUM.NEXTVAL, 'queen11!', '버거퀸', '전버거', NULL);
INSERT INTO MASTER_INFO VALUES(1234502948, NEW_STORE_NUM.NEXTVAL, 'food67*', '배고픈밤', '이수현', NULL);
INSERT INTO MASTER_INFO VALUES(1234534543, NEW_STORE_NUM.NEXTVAL, 'yumyum9&&', '맛있는족발', '이찬혁', NULL);
INSERT INTO MASTER_INFO VALUES(1234521232, NEW_STORE_NUM.NEXTVAL, 'risotto33#', '롤링파스타', '정유미', NULL);
INSERT INTO MASTER_INFO VALUES(1234587658, NEW_STORE_NUM.NEXTVAL, 'kimchi1212!', '찌개기사식당', '고윤정', NULL);
INSERT INTO MASTER_INFO VALUES(1234575434, NEW_STORE_NUM.NEXTVAL, 'potato44$', '피자하이스쿨', '차은우', NULL);
INSERT INTO MASTER_INFO VALUES(1234598123, NEW_STORE_NUM.NEXTVAL, 'salmon56%^', '포케올데이', '이영지', NULL);

SELECT* FROM MASTER_INFO;
COMMIT;
DROP TABLE MASTER_INFO;
DROP SEQUENCE;



-- 이용자 테이블, CUSTOMER_INFO
DROP TABLE CUSTOMER_INFO;
CREATE TABLE CUSTOMER_INFO(
    USER_ID VARCHAR2(40) PRIMARY KEY, -- 10자이내   
    USER_PW VARCHAR2(20) NOT NULL, -- 15자 이내(영어+숫자+특수문자)
    USER_NAME VARCHAR2(20) NOT NULL,
    GENDER VARCHAR2(5) NOT NULL,
    PHONE VARCHAR2(20) NOT NULL,
    ADDR VARCHAR2(40) NOT NULL,
    BIRTH DATE NOT NULL, -- 날짜형식으로 표기
    EMAIL VARCHAR2(20),	
    MONTHFEE NUMBER(5) NOT NULL
);

INSERT INTO CUSTOMER_INFO(USER_ID,USER_PW,USER_NAME,GENDER,PHONE,ADDR,BIRTH,EMAIL,MONTHFEE) VALUES('jsm123', 'so391!', '전소미','여', '010-1234-5678', '서울시 강남구 역삼2동', TO_DATE('1998-07-12','YYYY-MM-DD'), 'jsm98@naver.com', 5000);
INSERT INTO CUSTOMER_INFO(USER_ID,USER_PW,USER_NAME,GENDER,PHONE,ADDR,BIRTH,EMAIL,MONTHFEE) VALUES('ksj2345', 'se143@', '김세정','여', '010-2345-6789', '서울시 강남구 역삼1동', TO_DATE('1999-01-04','YYYY-MM-DD'), 'ksj99@naver.com', 15000);
INSERT INTO CUSTOMER_INFO(USER_ID,USER_PW,USER_NAME,GENDER,PHONE,ADDR,BIRTH,EMAIL,MONTHFEE) VALUES('cyj564', 'yu982#', '최유정','여', '010-3456-7890', '서울시 강남구 삼성1동', TO_DATE('2000-08-17','YYYY-MM-DD'), 'cyj00@naver.com', 5000);
INSERT INTO CUSTOMER_INFO(USER_ID,USER_PW,USER_NAME,GENDER,PHONE,ADDR,BIRTH,EMAIL,MONTHFEE) VALUES('jcy23', 'chae12$', '정채연','여', '010-4567-8901', '서울시 강남구 삼성2동', TO_DATE('1989-03-17','YYYY-MM-DD'), 'jcy89@naver.com', 5000);
INSERT INTO CUSTOMER_INFO(USER_ID,USER_PW,USER_NAME,GENDER,PHONE,ADDR,BIRTH,EMAIL,MONTHFEE) VALUES('kdy321', 'do143!', '김도연','여', '010-5678-9012', '서울시 강남구 대치2동', TO_DATE('1988-09-18','YYYY-MM-DD'), 'kdy88@naver.com', 15000);
INSERT INTO CUSTOMER_INFO(USER_ID,USER_PW,USER_NAME,GENDER,PHONE,ADDR,BIRTH,EMAIL,MONTHFEE) VALUES('csw11', 'si872@', '최시원','남', '010-6789-0123', '서울시 강남구 대치4동', TO_DATE('2002-02-09','YYYY-MM-DD'), 'csw02@naver.com', 5000);
INSERT INTO CUSTOMER_INFO(USER_ID,USER_PW,USER_NAME,GENDER,PHONE,ADDR,BIRTH,EMAIL,MONTHFEE) VALUES('khc981', 'hee772#', '김희철','남', '010-7890-1234', '서울시 강남구 논현2동', TO_DATE('1993-05-19','YYYY-MM-DD'), 'khc93@naver.com', 5000);
INSERT INTO CUSTOMER_INFO(USER_ID,USER_PW,USER_NAME,GENDER,PHONE,ADDR,BIRTH,EMAIL,MONTHFEE) VALUES('kgh310', 'gyu381@', '김규현','남', '010-8901-2345', '서울시 강남구 논현1동', TO_DATE('1990-11-12','YYYY-MM-DD'), 'kgh90@naver.com', 15000);
INSERT INTO CUSTOMER_INFO(USER_ID,USER_PW,USER_NAME,GENDER,PHONE,ADDR,BIRTH,EMAIL,MONTHFEE) VALUES('kkb754', 'gi193@', '김기범','남', '010-9012-3456', '서울시 강남구 대치1동', TO_DATE('1980-12-13','YYYY-MM-DD'), 'kkb@naver.com', 5000);
INSERT INTO CUSTOMER_INFO(USER_ID,USER_PW,USER_NAME,GENDER,PHONE,ADDR,BIRTH,EMAIL,MONTHFEE) VALUES('lsm8567', 'seong7!', '이성민','남', '010-0123-4567', '서울시 강남구 청담동', TO_DATE('1987-10-12','YYYY-MM-DD'), 'lsm87@naver.com', 15000);

COMMIT;
SELECT * FROM CUSTOMER_INFO;




-- 음식 테이블, FOOD
DROP TABLE FOOD;
SELECT * FROM FOOD;
COMMIT;
CREATE TABLE FOOD (
--MENU_NUM은 점포 등록시(한식은 10,일식은 20 등의 카테고리 구분을 위해)
--필요시 CATEGORY_INFO는 생략 가능(음식테이블은 점주의 메뉴관리창을 위해)
    CATEGORY_INFO  VARCHAR2(20)  NOT NULL, 
    STORE_NUM      NUMBER(10)    NOT NULL,
    MENU_NAME      VARCHAR(10)   NOT NULL,
    PRICE          NUMBER(6)     NOT NULL
);
-- CATEGORY_NUM 은 CATEGORY_INFO의 손쉬운 등록 및 삭제, 사용을 위해

--10 한식대첩 점포 데이터
INSERT INTO FOOD VALUES ('KOREAN_FOOD',10,'KSOUP', 7000);
INSERT INTO FOOD VALUES ('KOREAN_FOOD',10,'KROAST', 8000);
INSERT INTO FOOD VALUES ('KOREAN_FOOD',10,'KSNACK', 5000);
INSERT INTO FOOD VALUES ('KOREAN_FOOD',10,'KMEAT', 10000);
--20 마라왕
INSERT INTO FOOD VALUES ('CIHNA_FOOD', 20, 'CNOODLE', 7000);
INSERT INTO FOOD VALUES ('CIHNA_FOOD', 20, 'CFRIED', 8000);
INSERT INTO FOOD VALUES ('CIHNA_FOOD', 20, 'CSOUP', 5000);
INSERT INTO FOOD VALUES ('CIHNA_FOOD', 20, 'CROAST', 10000);
--30일등스시
INSERT INTO FOOD VALUES ('JAPANESE_FOOD', 30, 'JRAMEN', 5000);
INSERT INTO FOOD VALUES ('JAPANESE_FOOD', 30, 'JSUSI', 10000);
INSERT INTO FOOD VALUES ('JAPANESE_FOOD', 30, 'JROAST', 8000);
INSERT INTO FOOD VALUES ('JAPANESE_FOOD', 30, 'JRICE', 9000);
--버거퀸
INSERT INTO FOOD VALUES ('FAST_FOOD', 40, 'FBURGER', 5000);
INSERT INTO FOOD VALUES ('FAST_FOOD', 40, 'FPIZZA', 12000);
INSERT INTO FOOD VALUES ('FAST_FOOD', 40, 'FDOG', 3000);
INSERT INTO FOOD VALUES ('FAST_FOOD', 40, 'FTACO', 5000);
--배고픈밤
INSERT INTO FOOD VALUES ('YA_SICK', 50, 'NMEAT', 18000);
INSERT INTO FOOD VALUES ('YA_SICK', 50, 'NORGAN', 18000);
INSERT INTO FOOD VALUES ('YA_SICK', 50, 'NSEAFOOD', 22000);
INSERT INTO FOOD VALUES ('YA_SICK', 50, 'NCHIKEN', 18000);
--롤링파스타
INSERT INTO FOOD VALUES ('WESTERN_FOOD', 70, 'WSALADE', 18000);
INSERT INTO FOOD VALUES ('WESTERN_FOOD', 70, 'WNOODLE', 18000);
INSERT INTO FOOD VALUES ('WESTERN_FOOD', 70, 'WMEAT', 22000);
INSERT INTO FOOD VALUES ('WESTERN_FOOD', 70, 'WSOUP', 18000);


--주문리스트
DROP TABLE ORDERLIST;
DROP SEQUENCE NEW_ORDER_NUM;
COMMIT;
CREATE SEQUENCE NEW_ORDER_NUM
INCREMENT BY 1
--9090 = GOGO
START WITH 9090
MAXVALUE 99999
MINVALUE 9090
NOCYCLE
CACHE 2;
--int STORE_NUM, String MENU_NAME, int AMOUNT, String DILIVERY_OPTION, String PAYMENT_OPTION
SELECT * FROM ORDERLIST;

CREATE TABLE ORDERLIST(
    ORDER_NUM        NUMBER(6)  PRIMARY KEY,
    DATE_NUM         DATE          ,
    CATEGORY_INFO    VARCHAR2(20)    NOT NULL,
    STORE_NUM        NUMBER(2)     NOT NULL,
    MENU_NAME        VARCHAR2(10)  NOT NULL,
    AMOUNT           NUMBER(2)     NOT NULL,
    DILIVERY_OPTION  VARCHAR2(10)  CHECK(DILIVERY_OPTION = '카드' OR DILIVERY_OPTION = '현금') ,
    PAYMENT_OPTION   VARCHAR2(10)  CHECK(PAYMENT_OPTION = '포장' OR PAYMENT_OPTION = '배달'),
    TOTAL_PAYMENT    NUMBER(10)    
); 

SELECT * FROM ORDERLIST WHERE ORDER_NUM = 9090;

SELECT O.ORDER_NUM, O.STORE_NUM, F.MENU_NAME, AMOUNT, F.PRICE, F.PRICE * AMOUNT AS TOTALSALES 
FROM FOOD F  
JOIN ORDERLIST O 
ON F.MENU_NAME = O.MENU_NAME
WHERE O.ORDER_NUM = 9090;   

SELECT F.CATEGORY_INFO , M.STORE_NUM, F.MENU_NAME, (F.PRICE * O.AMOUNT) AS TOTAL_PAYMENT 
FROM ORDERLIST O 
INNER JOIN FOOD F ON F.MENU_NAME = O.MENU_NAME
INNER JOIN MASTER_INFO M ON M.STORE_NUM = O.STORE_NUM
AND m.STORE_NUM = 10;

INSERT INTO ORDERLIST(ORDER_NUM, DATE_NUM, CATEGORY_INFO, STORE_NUM, MENU_NAME, AMOUNT, DILIVERY_OPTION, PAYMENT_OPTION) 
VALUES(NEW_ORDER_NUM.NEXTVAL, TO_DATE(SYSDATE), 'JAPANESE_FOOD',30,'B',3,'배달','카드');

DROP TABLE REVIEW;
DROP SEQUENCE NUMBER_SEQ;
COMMIT;

CREATE SEQUENCE NUMBER_SEQ
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 9999
	MINVALUE 1
	NOCYCLE;

CREATE TABLE REVIEW (
    REVIEW_NUM NUMBER(4) PRIMARY KEY,
    STORE_NUM NUMBER(4), 
    MENU_NAME VARCHAR2(15) NOT NULL,
    SCORE NUMBER(1) NOT NULL,
    WRITE_REVIEW VARCHAR2(100) NOT NULL,
    USER_ID VARCHAR2(20) NOT NULL
    -- MENU_NAME  VARCHAR2(20) REFERENCES FOOD(MENU_NAME)
);

INSERT INTO REVIEW VALUES (NUMBER_SEQ.NEXTVAL, 10 ,'KMEAT', 4, '맛있어요.', 'jsm123');

SELECT * 
FROM REVIEW R 
JOIN CUSTOMER_INFO C 
ON R.USER_ID = C.USER_ID;

SELECT REVIEW_NUM, F.STORE_NUM, F.MENU_NAME, SCORE, R.WRITE_REVIEW, C.USER_ID
FROM REVIEW R
INNER JOIN FOOD F ON R.MENU_NAME = F.MENU_NAME
INNER JOIN CUSTOMER_INFO C ON R.USER_ID = C.USER_ID
AND F.MENU_NAME = ?;