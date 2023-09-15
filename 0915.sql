-- 문자 함수 : 문자 데이터를 가공하는 것 
-- UPPER(대문자), LOWER(소문자), INITCAP(첫글자 대문자 나머지 소문자)
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

SELECT *
FROM EMP
WHERE UPPER(ENAME) = UPPER('james');

-- LENGTH : 문자열 길이를 반환 
-- LENGTHB : 문자열의 바이트 수 반환
SELECT LENGTH('한글'), LENGTHB('한글') -- 2바이트/ 3바이트
FROM DUAL; -- 테이블 없이 가상으로 실행할 때 DUAL 

-- SUBSTR / SUBSTRB : 문자열 데이터, 시작 위치, 추출 길이
-- 데이터베이스 시작위치가 0이 아님(프로그래밍(배열)이 아니라서)
-- 2번째 매개변수는 길이 의미, 3번째 매개변수를 생략하면 끝까지 
SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5)
FROM EMP;

SELECT JOB, 
    SUBSTR(JOB, -LENGTH(JOB)), -- 음수는 뒤에서부터 계산(-8 ~ -1) , 길이에 대한 음수값으로 역순 접근
    SUBSTR(JOB, -LENGTH(JOB),2), -- SALESMAN, -8이면 S 위치에서 길이가 2만큼 출력
    SUBSTR(JOB,-3)
FROM EMP;

-- INSTR : 문자열 데이터 안에 특정 문자나 문자열이 어디에 포함되어 있는지 알고자 할 때 사용
SELECT INSTR('HELLO, ORACLE!','L') AS INSTR_1,
    INSTR('HELLO, ORACLE!', 'L',5) AS INSTR_2, -- 3번째 인자로 찾을 시작 위치 지정(5부터 찾아라)
    INSTR('HELLO, ORACLE!','L',2,2) AS INSTR_3 -- 3번째 인자는 시작위치, 4번째 인자는 몇번째인지
FROM DUAL;


-- 특정 문자가 포함된 행 찾기 
SELECT *
FROM EMP
WHERE INSTR(ENAME,'S') > 0;

SELECT *
FROM EMP
WHERE ENAME LIKE '%S%'; -- 위 쿼리와 같은 값

--REPLACE : 특정 문자열 데이터에 포함된 문자를 다른 문자로 대체 할 경우 사용
-- 대체할 문자를 넣지 않으면 해당 문자 삭제
SELECT '010-1234-5678' AS REPLACE_BEFORE,
    REPLACE('010-1234-5678','-',' ') AS REPLACE_1, -- 공백으로 대체
    REPLACE('010-1234-5678','-') AS REPLACE_2 -- 해당 문자 삭제
FROM DUAL;

-- LPAD / RPAD : 기준 공간의 칸 수를 특정 문자로 채우는 함수
SELECT LPAD('ORACLE', 10, '+') -- LPAD 는 왼쪽의미
FROM DUAL;
SELECT RPAD('ORACLE',10,'+')
FROM DUAL;

SELECT 'ORACLE',
    LPAD('ORACLE',10,'#') AS LPAD_1,
    RPAD('ORACLE',10,'*') AS RPAD_1,
    LPAD('ORACLE',10) AS LPAD_2,
    RPAD('ORACLE',10) AS RPAD_2
FROM DUAL;

-- 개인정보 뒤자리 * 표시로 출력하기
SELECT 
    RPAD('971225-',14,'*') AS RPAD_JMNO,
    RPAD('010-1234-',13,'*') AS RPAD_PHONE
FROM DUAL;

-- 두 문자열을 합치는 CONCAT 함수
SELECT CONCAT(EMPNO,ENAME), -- 문자를 이어붙임
    CONCAT(EMPNO, CONCAT(' : ',ENAME)) -- : (문자)으로 이어붙임
FROM EMP
WHERE ENAME = 'JAMES';

-- TRIM / LTRIM / RTRIM : 문자열 내에서 특정 문자열을 지우기 위해 사용
-- 삭제할 문자를 지정하지 않으면 공백 제거(공백 제거 용도로는 괜찮음)
SELECT '[' || TRIM('   _Oracle_   ') || ']' AS TRIM, -- 공백을 지움
 '[' || LTRIM('   _Oracle_   ') || ']' AS LTRIM,
 '[' || LTRIM('<_Oracle_>', '<_') || ']' AS LTRIM_2, -- 특정 문자 지움
 '[' || RTRIM('    _Oracle_    ') || ']' AS RTRIM,
 '[' || RTRIM('<_Oracle_>', '_>') || ']' AS RTRIM_2 -- 특정 문자 지움
 FROM DUAL;

SELECT TRIM('SDHFHSDLFFLS         ', 'S')
FROM DUAL; -- 공백없이 트림은 문자열을 넣을 수 없고, LTRIM,RTRIM만 가능

-- 날짜 데이터를 다루는 날짜 함수 
-- SYSDATE : 운영체제의 현재 날짜와 시간을 정보를 가져옴
SELECT SYSDATE FROM DUAL;

-- 날짜 데이터는 정수값으로 +, - 가능
SELECT SYSDATE AS 오늘,
    SYSDATE-1 AS 어제,
    SYSDATE+1 AS 내일
FROM DUAL;

-- 몇 개월 이후 날짜 구하는 ADD_MONTH 함수
-- 특정 날짜에 지정한 개월 수 이후의 날짜 데이터를 반환하는 함수
SELECT SYSDATE,
    ADD_MONTHS(SYSDATE, 3) -- 두번째 인자는 달 수를 의미
FROM DUAL;

-- EMP TABLE에서 입사 10주년이 되는 사원들 데이터 출력
SELECT EMPNO, ENAME, HIREDATE,
    ADD_MONTHS(HIREDATE, 120) AS 입사10주년
FROM EMP;

-- SYSDATE와 ADD_MONTHS 함수를 사용하여 현재 날짜와 6개월 후 날짜가 출력
SELECT SYSDATE,
    ADD_MONTHS(SYSDATE,6) 
FROM DUAL;

-- 두 날짜 간의 개월 수 차이를 구하는 MONTHS_BETWEEN 함수
SELECT EMPNO, ENAME, HIREDATE,SYSDATE, 
    MONTHS_BETWEEN(HIREDATE,SYSDATE) AS MONTH1, -- 음수
    MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH2, -- 양수
    TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS MONTH3, -- 버림수, ROUND나 TRUNC
    ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS MONTH4
FROM EMP;


-- 날짜 정보 추출 함수
-- EXTRACT 함수는 날짜 유형의 데이터로부터 날짜 정보를 분리하여 새로운 컬럼의 형태로 추출
SELECT EXTRACT(YEAR FROM DATE '2023-09-15') AS 년도추출
FROM DUAL;

SELECT *
FROM EMP
WHERE EXTRACT(MONTH FROM HIREDATE) = 12; -- 입사일 중 12월에 입사한 사람만 뽑아냄

-- 연습문제 -- 

-- 오늘 날짜에 대한 정보 조회 
SELECT SYSDATE
FROM DUAL;

-- EMP테이블에서 사번, 사원명, 급여 조회
--(단, 급여는 100단위까지의 값만 출력 처리하고 급여 기준 내림차순 정렬)
SELECT EMPNO, ENAME, ROUND(SAL, -2)
FROM EMP
ORDER BY SAL DESC;

-- EMP테이블에서 사원번호가 홀수인 사원들을 조회
SELECT *
FROM EMP
WHERE MOD(EMPNO, 2) = 1;

-- EMP테이블에서 사원명, 입사일 조회(단, 입사일은 년도와 월을 분리 추출해서 출력)
SELECT ENAME, EXTRACT(YEAR FROM HIREDATE), EXTRACT(MONTH FROM HIREDATE)
FROM EMP;

-- EMP테이블에서 9월에 입사한 직원의 정보 조회
SELECT *
FROM EMP
WHERE EXTRACT(MONTH FROM HIREDATE) = 9;

-- EMP테이블에서 81년도에 입사한 직원 조회
SELECT *
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) = 1981;

-- EMP테이블에서 이름이 'E'로 끝나는 직원 조회
SELECT *
FROM EMP
WHERE ENAME LIKE '%E';

-- EMP테이블에서 이름의 세 번째 글자가 'R'인 직원의 정보 조회
SELECT *
FROM EMP
WHERE ENAME LIKE '%__R%';

-- EMP테이블에서 사번, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회
SELECT EMPNO, ENAME, HIREDATE, 
    ADD_MONTHS(HIREDATE,40*12)
FROM EMP;

-- EMP테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회
SELECT * 
FROM EMP
WHERE MONTHS_BETWEEN(SYSDATE,HIREDATE) /12 >= 38;

-- EMP테이블에서 년도만 추출
SELECT EXTRACT(YEAR FROM SYSDATE)
FROM DUAL;

-- 자료형을 변환하는 형 변환
-- 자동 형 변환 : NUMBER + 문자타입 => NUMBER 타입으로 자동 변환
SELECT EMPNO, ENAME, EMPNO + '500' -- 숫자는 가능
FROM EMP
WHERE ENAME = 'FORD';

SELECT EMPNO,ENAME,EMPNO + 'ABCD' -- 문자는 불가능
FROM EMP
WHERE ENAME = 'FORD';

-- 날짜, 숫자를 문자로 변환하는 TO_CHAR 함수
-- 주로 날짜 데이터를 문자 데이터로 변환하는데 사용
-- 자바의 데이터포멧바꿀 때 SIMPLEDATEFORMAT() 유사
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS') AS "현재 날짜 시간"
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY/MON/DD HH:MI:SS') AS "현재 날짜 시간"
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY/MON/DDD HH:MI:SS') AS "현재 날짜 시간"
FROM DUAL;

-- 다양한 형식으로 출력 하기
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'CC') AS 세기,
    TO_CHAR(SYSDATE, 'YY') AS 연도,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS ') AS "년/월/일 시:분:초",
    TO_CHAR(SYSDATE, 'Q') AS 쿼터,
    TO_CHAR(SYSDATE, 'DD') AS 일,
    TO_CHAR(SYSDATE, 'DDD') AS 경과일,
    TO_CHAR(SYSDATE, 'HH') AS "12시간제",
    TO_CHAR(SYSDATE, 'HH12') AS "12시간제",
    TO_CHAR(SYSDATE, 'HH24') AS "24시간제",
    TO_CHAR(SYSDATE, 'W') AS 몇주차
FROM DUAL;

-- 여러 언어로 날짜(월) 출력 하기
SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'MM') AS MM,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MON_KOR,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MON_ENG,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MONTH_KOR,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MONTH_JPN,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MONTH_ENG
FROM DUAL;

-- 여러 언어로 날짜(요일) 출력하기
SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'MM') AS MM,
     TO_CHAR(SYSDATE, 'DD') AS DD,
     TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = KOREAN' ) AS DY_KOR,
     TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DY_JPN,
     TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS DY_ENG,
     TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = KOREAN' ) AS DAY_KOR,
     TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DAY_JPN,
     TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS DAY_ENG
FROM DUAL;

-- 시간 형식 지정하여 출력하기
SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
     TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM,
     TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
FROM DUAL;

-- 숫자 데이터 형식을 지정하여 출력하기
SELECT SAL, 
    TO_CHAR(SAL,'$999,999') AS SAL_$,
    TO_CHAR(SAL,'L999,999') AS SAL_L,
    TO_CHAR(SAL,'999,999.00') AS SAL_1,
    TO_CHAR(SAL,'000,999,999.00') AS SAL_2,
    TO_CHAR(SAL,'000999999.99') AS SAL_3,
    TO_CHAR(SAL,'999,999,00') AS SAL_4
FROM EMP;