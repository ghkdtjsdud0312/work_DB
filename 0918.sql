-- GROUP BY : 여러 데이터에서 의미 있는 하나의 결과를 특정 열 값별로 묶어서 출력할 떄 사용
SELECT ROUND(AVG(SAL),2) AS 사원전체평균
FROM EMP; 

-- 부서별 사원 평균
SELECT DEPTNO, ROUND(AVG(SAL),2) AS 부서별평균
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- GROUP BY 절 없이 구현한다면?
SELECT AGV(SAL) FROM WHERE DEPTNO = 10;
SELECT AGV(SAL) FROM WHERE DEPTNO = 20;
SELECT AGV(SAL) FROM WHERE DEPTNO = 30;

-- 집합연산자를 사용하여 구현 하기
SELECT AGV(SAL) FROM WHERE DEPTNO = 10
UNION ALL
SELECT AGV(SAL) FROM WHERE DEPTNO = 20
UNION ALL
SELECT AGV(SAL) FROM WHERE DEPTNO = 30;

-- 부서코드, 급여 합계, 부서 평균, 부서 코드 순 정렬을 
SELECT DEPTNO 부서코드, 
    SUM(SAL) 합계,
    ROUND(AVG(SAL), 2) 평균,
    COUNT(*) 인원수-- 각 부서별 인원 수
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- HAVING절 : GROUP BY 절이 존재하는 경우에만 사용 가능
-- GROUP BY 절을 통해 그룹화된 결과 값의 번위를 제한할 때 사용
-- 먼저 부서별, 직책별로 그룹화하여 평균을 구함
-- 그 다음 각 그룹별 급여 평균이 2000이 넘는 그룹을 출력함
SELECT DEPTNO,JOB,ROUND(AVG(SAL),2)
FROM EMP
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000 -- 그룹끼리 묶고 골라냄
ORDER BY DEPTNO, JOB;

-- WHERE절을 사용하는 경우 
-- 먼저 급여가 2000 이상인 사람들을 골라냄
-- 조건에 맞는 사원 중에서 부서별, 직책별 급여의 평균을 구해서 출력
SELECT DEPTNO,JOB,ROUND(AVG(SAL),2)
FROM EMP
WHERE SAL >= 2000 -- 그룹별- 직책뱔 
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;



-- 1. 부서별 직책의 평균 급여가 500 이상인 사원들의 부서번호, 직책, 부서별 직책의 평균 급여 출력
SELECT EMPNO, JOB, ROUND(AVG(SAL),2)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 500
ORDER BY DEPTNO, JOB;

-- 2. EMP 테이블을 이용하여 부서번호, 평균급여, 최고급여, 최저급여, 사원수를 출력,  단, 평균 급여를 출력 할 때는 소수점 제외하고 부서 번호별로 출력
SELECT DEPTNO "부서번호", 
    TRUNC(AVG(SAL)) "평균 급여",
    MAX(SAL) "최고급여",
    COUNT(*) "사원 수"
FROM EMP
GROUP_BY DEPTNO;

-- 3. 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원을 출력 
SELECT JOB 직책 COUNT(*) "사원 수"
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3;

-- 4. 사원들의 입사 연도를 기준으로 부서별로 몇 명이 입사했는지 출력
-- SELECT EXTRACT(YEAR FROM HIREDATE) "입사일"
SELECT TO_CHAR(HIREDATE, 'YYYY') 입사일,
    DEPTNO,
    COUNT(*) 사원수
FROM EMP
GROUPO BY TO_CHAR(HIREDATE,'YYYY'), DEPTNO
ORDER BY TO_CHAR(HIREDATE,'YYYY');
-- 5. 추가 수당을 받는 사원 수와 받지 않는 사원수를 출력 (O, X로 표기 필요)
SELECT NVL2(COMM,'O','X') "추가 수당",
    COUNT(*) 사원수
FROM EMP
GROUP_BY NVL(COMM,'O','X');
-- 6. 각 부서의 입사 연도별 사원 수, 최고 급여, 급여 합, 평균 급여를 출력
SELECT DEPTNO, 
    TO_CHAR(HIREDATE,'YYYY') 입사년도,
    COUNT(*) 사원수
    MAX(SAL) 최고급여,
    SUM(SAL) 합계,
    TRUNC(AVG(SAL)) 평균급여
FROM EMP
GROUP BY DEPTNO,TO_CHAR(HIREDATE,'YYYY')
ORDER BY DEPTNO, TO_CHAR(HIREDATE,'YYYY');

-- 그룹화와 관련된 여러 함수 : ROLLUP, CUBE...
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

-- ROLLUP : 명시한 열을 소그룹부터 대그룹의 순서로 각 그룹별 결과를 출력하고 마지막에 총 데이터 결과를 출력
-- 각 부서별 중간 결과를 보여줌
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);

-- JOIN : 두 개 이상의 테이블에서 데이터를 가져와서 연결하는 데 사용하는 SQL기능
-- RDMS에서는 테이블 설계 시 무결성 원칙으로 인해 동일한 정보가 여러 군데 존재하면 안되기 때문에
-- 필연적으로 테이블을 관리 목적에 맞게 설계함
SELECT *
FROM EMP, DEPT;

-- 열 이름을 비교하는 조건식으로 조인하기
SELECT *
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO -- 조인의 기준 열
ORDER BY EMPNO;

-- 테이블 별칭 사용하기
SELECT *
FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;

-- 조인 종류 : 두 개 이상의 테이블을 하나의 테이블처럼 가로로 늘려서 출력하기 위해 사용
-- 조인은 대상 데이터를 어떻게 연결하는가에 따라 등가, 비등가, 자체, 외부 조인으로 구분
-- 등가 조인 : 테이블을 연결한 후 출력 행을 각 테이블의 특정 열에 일치한 데이터를 기준으로 선정하는 방식
-- 등가 조인에는 안시(ANSI) 조인과 오라클 조인이 있음
-- 오라클 조인 
SELECT EMPNO, ENAME, D.DEPTNO, DNAME, LOC 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND E.DEPTNO = 10
    ORDER BY D.DEPTNO;

-- 급여가 3000이상인 사람 출력 
SELECT EMPNO, ENAME, D.DEPTNO, SAL, DNAME, LOC 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL >= 3000
    ORDER BY D.DEPTNO;

-- 안시 조인
SELECT EMPNO, ENAME, D.DEPTNO, SAL, DNAME, LOC 
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    WHERE E.DEPTNO = 10
    ORDER BY D.DEPTNO;

-- EMP 테이블 별칭을 E로, DEPT 테이블 별칭은 D로 하여 
-- 다음과 같이 등가 조인을 했을 때 급여가 2500 이하이고 
--사원 번호가 9999 이하인 사원의 정보가 출력되도록 작성(ANSI와 ORACLE JOIN)
-- 오라클 조인
SELECT EMPNO, ENAME, SAL, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO -- 동등조인, 이너조인(두 테이블이 일치하는 데이터만 선택)
    AND SAL <= 2500
    AND E.EMPNO <= 9999
    ORDER BY E.EMPNO;

-- 안시 조인
SELECT EMPNO, ENAME, SAL, E.DEPTNO, DNAME, LOC
    FROM EMP E JOIN DEPT D -- JOIN걸어줘야함 
    ON E.DEPTNO = D.DEPTNO
    WHERE SAL <= 2500 
    AND E.EMPNO <= 9999
    ORDER BY E.EMPNO;



 