-- 정렬을 위한 ORDER BY 절
SELECT * FROM EMP
ORDER BY SAL asc; -- asc는 오름차순

-- 사원번호 기준으로 오름차순 정렬
SELECT * FROM EMP
ORDER BY SAL DESC;

-- 여러 컬럼 기준으로 정렬하기
-- 정렬 조건이 없으면 기본적으로 오름차순
-- 급여순으로 정렬하고 급여가 같은 경우 이름순 정렬
SELECT * FROM EMP
ORDER BY SAL, ENAME DESC;  -- 정렬 조건은 뒤에 붙어야함
-- 오름차순 정렬 이후 이름 기준 내림차순


-- 연결 연산자 : SELECT문 조회 시 컬럼 사이에 특정한 문자를 넣고 싶을 때 사용
-- | 는 연결시켜주는 것
SELECT ENAME || 'S JOB IS' || JOB AS EMPLOYEE 
FROM EMP;

-- 실습문제 -------------------------------------------------
-- 1. 사원이름이 S로 끝나는 사원 데이터 출력
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';

-- 2. 30번 부서에서 근무하는 사원 중 직책이 
-- SALESMAN인 사원의 사원번호, 이름, 직책, 급여, 부서번호 출력
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30 AND JOB = 'SALESMAN';

-- 3. 20번,30번 부서에 근무하는 사원 중 급여 2000 초과인 사원의 
-- 사원번호, 이름, 급여, 부서번호 출력
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (20,30) OR SAL > 2000;

-- 4. BETWEEN 연산자 사용하지 않고 급여가 2000 이상 3000 이하 데이터 출력
SELECT *
FROM EMP
WHERE SAL >= 2000 AND SAL <= 3000;

-- 5. 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중 급여가 
-- 1000~2000 사이가 아닌 사원 이름, 사원 정보, 급여, 부서 번호 출력
SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30 
AND ENAME LIKE '%E%' 
AND SAL NOT BETWEEN 1000 AND 2000;

-- 6. 추가 수당이 존재하지 않고 상급자의 직책이 MANAGER,CLERK인 사원에서
-- 사원 이름의 두번째 글자가 L이 아닌 사원의 정보를 출력
SELECT *
FROM EMP
WHERE COMM IS NULL
AND MGR IS NOT NULL
AND JOB IN ('MANAGER','CLERK')
AND ENAME NOT LIKE '_L%';

-- 1. EMP테이블에서 COMM의 값이 NULL이 아닌 정보 조회
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;
-- 2. EMP테이블에서 커미션을 받지 못하는 직원 조회
SELECT *
FROM EMP
WHERE COMM IS NULL OR COMM = 0;
-- 3. EMP테이블에서 관리자가 없는 직원 정보 조회
SELECT *
FROM EMP
WHERE MGR IS NULL;
-- 4. EMP테이블에서 급여가 많이 받는 직원 순으로 조회
SELECT *
FROM EMP
ORDER BY SAL DESC;
-- 5. EMP테이블에서 급여가 같을 경우 커미션을 내림차순 정렬 조회
SELECT *
FROM EMP
ORDER BY SAL DESC, COMM DESC;
-- 6. EMP테이블에서 사원번호, 사원명, 직책, 입사일 조회 (단, 입사일을 오름차순 정렬)
SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
ORDER BY HIREDATE ASC;
-- 7. EMP테이블에서 사원번호, 사원명 조회(사원번호 기준 내림차순 정렬)
SELECT EMPNO, ENAME
FROM EMP
ORDER BY EMPNO DESC;
-- 8. EMP테이블에서 사번, 입사일, 사원명, 급여 조회
-- (부서번호가 빠른 순으로, 같은 부서번호일 때는 최근 입사일 순으로 처리)
SELECT EMPNO, HIREDATE, ENAME, SAL, DEPTNO
FROM EMP
ORDER BY DEPTNO, HIREDATE DESC;

-- 함수 --
-- 오라클에서 함수는 내장 함수 사용자 정의 함수로 나누어 짐
-- 내장 함수는 단일행 함수와 다중행(집계)함수로 나누어 짐
-- DUAL 테이블 : 오라클의 SYS계정에서 제공하는 테이블로 함수나 계산식에서 테이블 참조없이 실행해보기 위해 제공됨
-- 계산식에서 테이블 참조없이 실행해보기 위해 제공됨(DUMMY테이블)

-- ABS : 절대값을 구하는 함수
SELECT -10, ABS(-10) FROM DUAL;

--ROUND : 반올림한 결과를 반환하는 함수 : ROUND(숫자, 반올림 위치), 위치는 음수값도 줄 수 있음
SELECT ROUND(1234.5678) AS ROUND, 
    ROUND(1234.5678, 0) AS ROUND_0,
    ROUND(1234.5678, 1) AS ROUND_1,
    ROUND(1234.5678, 2) AS ROUND_2,
    ROUND(1234.5678, -1) AS ROUND_MINUS1,
    ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL;

-- TRUNC : 버림한 결과를 반환하는 함수
SELECT TRUNC(1234.5678) AS TRUNC, 
    TRUNC(1234.5678, 0) AS TRUNC_0,
    TRUNC(1234.5678, 1) AS TRUNC_1,
    TRUNC(1234.5678, 2) AS TRUNC_2,
    TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
    TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL;

-- MOD : 나누기한 나머지를 출력하는 함수
SELECT MOD(21, 5) FROM DUAL;

-- CEIL : 소수점 이하를 무조건 올림
SELECT CEIL(12.0000001) FROM DUAL;

-- FLOOR : 소수점 이하를 무조건 내림
SELECT FLOOR(12.99999999) FROM DUAL;

-- POWER : 정수A를 정수B만큼 제곱하는 함수(3, 4)
SELECT POWER(3,4) FROM DUAL;

