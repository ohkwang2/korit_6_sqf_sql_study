# 데이터 조회(DML - SELECT)

select * from student_tb;
select `student_id`, `student_name`, `phone`, `email`, `introduce`, `admission_date` from `study`.`student_tb`;
select student_id, student_name, phone, email, introduce, admission_date from `study`.`student_tb`;
select student_id, student_name, phone, email, introduce, admission_date from `student_tb`;
select student_id, student_name, phone, email, introduce, admission_date from student_tb;
select student_id, student_name from student_tb;
select student_name, student_id from student_tb;
# 해당 컬럼명을 변경
select student_id, student_name as s_name from student_tb;

# union(all) 병합 조건 - 칼럼의 개수와 자료형이 동일한 select 결과만 병합 가능
# union <- select 결과에서 중복을 제거하여 합쳐줌
# union all <- 중복 제거 없이 select 결과 병합
# 테이블명이 존재하지 않는 경우 'as 테이블명'을 통해 입력 가능
# 셀렉트 결과값도 테이블로 사용 할 수 있다 (서브쿼리)!! ★중요★
select
	number, name
from
	(select 1 as number, "김준일" as name, 31 as age
	union
	select 2 as number, "김준이" as name, 32 as age
	union
	select 2 as number, "김준이" as name, 32 as age) as temp_tb;

select student_id, student_name from student_tb
union all
select student_id, phone from student_tb;