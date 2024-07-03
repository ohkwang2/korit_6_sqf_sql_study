### where - 조건

## 단순 비교
# 단일 조건
select
	*
from
	student_tb
where
	student_name = "김준일";

#select 실행 순서 : 테이블(from) -> 행(where) -> 열(select)
# 다중 조건
# or
select
	student_id,
    student_name
from
	student_tb
where
	student_name = "김준일"
	or student_name = "김준이";

# and
select
	*
from
	student_tb
where
	student_id > 5
    and student_id < 7;

# in
select
	*
from
	student_tb
where
	student_name in ("김준일", "김준이", "김준삼");
    
#between A and B
select
	*
from
	student_tb
where
	student_id between 5 and 7;
    
# NOT
select
 *
 from
	student_tb
where
	 not student_name = "김준일";

# null 체크
# is null 긍정
# is not null 부정
select
	*
from
	student_tb
where
	introduce is null;
	##introduce is not null;

insert into student_tb
values
	(0, "손경태", "010-1111-2222", "aaa@gmail.com", null, now()),
	(0, "김지현", "010-1111-3333", "bbb@naver.com", null, now()),
	(0, "김동인", "010-1111-4444", "ccc@gmail.com", null, now()),
	(0, "김정현", "010-1111-5555", "aaabbb@naver.com", null, now()),
	(0, "권오광", "010-1111-6666", "bbbccc@kakao.com", null, now()),
	(0, "권혁진", "010-1111-7777", "aaabbbccc@kakao.com", null, now());

## 와일드 카드 (like)
select
	*
from
	student_tb
where
	#student_name like "김%"; 	해당 글자로 시작하는 것들 다 선택
    #email like "%gmail.com";	해당 글자로 끝나는 것들 다 선택
    #phone like "#2222%"; 		해당 값을 포함하는 것들 다 선택
    phone like "%2222%"
    and not phone like "%2222";

select
	*
from
	student_tb
where
	# 앞에 3자가 있고 bbb뒤에 어떤 글자가 와도 된다는 조건
	email like "___bbb%"
	