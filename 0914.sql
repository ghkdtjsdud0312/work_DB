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