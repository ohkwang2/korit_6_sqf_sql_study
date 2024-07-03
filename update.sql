# 데이터 수정(DML - UPDATE)

select * from student_tb;

select
	student_id, student_name, email
from
	student_tb
where
	student_name = "김준칠";

update
	 student_tb
set
	email = "skjil1214@gmail.com"
where
	# 값이 한 개일 경우 '=', 여러개일 경우 'in' 사용
	student_id = (select
					student_id
				from
					(select * from student_tb) as temp_student_tb
				where
					student_name = "김준칠");

update
	student_tb
set
	phone = "010-1234-4321",
    email = "sssss@naver.com"
where
	student_id = 4;