# 데이터 삽입 (DML - INSERT)

select * from student_tb;

# insert into `study`.`student_tb`() values();	Database가 use 되지 않은 경우
# insert into `student_tb`() values();			Database가 use 상태인 경우

# 단일 데이터 insert
# introduce는 null 허용이라서 키값에서 제외하고 입력 가능
insert into student_tb
	(student_id, student_name, phone, email, admission_date)
values
	(0, "김준일", "010-9988-1916", "skjil1218@kakao.com", now());
    
# 다중 데이터 insert
insert into student_tb
	(student_id, student_name, phone, email, admission_date)
values
	(0, "김준이", "010-9988-1917", "skjil1219@kakao.com", now()),
	(0, "김준삼", "010-9988-1918", "skjil1210@kakao.com", now()),
	(0, "김준사", "010-9988-1919", "skjil1211@kakao.com", now());

# value는 key값에 입력한 순서대로 작성하여야 함.
insert into student_tb
	(student_id, phone, email, introduce, student_name, admission_date)
values
	(0, "010-9988-1911", "skjil1213@kakao.com", null, "김준육", now());

#모든 컬럼을 채우는 경우 key값 생략 가능. but 칼럼 순서와 개수, 데이터 타입이 모두 맞아야 함.
insert into student_tb
values
	(0, "김준칠", "010-9988-1912", "skjil1214@kakao.com", null, now());