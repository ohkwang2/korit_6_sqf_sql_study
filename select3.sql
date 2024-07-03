# group by - 그룹
# 집계 -> count, max, min, sum, avg

select
	admission_date,
    count(student_name)
    #count(*)			전체 행의 개수
	#count(introduce)	null은 count를 하지 않음
from
	student_tb
group by
	admission_date;