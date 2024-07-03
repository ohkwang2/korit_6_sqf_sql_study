-- Group by

# distinct > 중복제거된 결과값 출력 (중복해서 사용할 수 없음)
select
    category_id,
    count(*)
from
	book_tb
where
	book_id > 7000
group by
	category_id;
    
-- 도서명 중 '돈'이라는 글자가 들어간 데이터들을 찾아 카테고리별로 묶으시오.
-- 그리고 카테고리 별로 도서 개수가 출력되어야 한다.

select
	category_id,
    count(*) as category_count
from
	book_tb
where
	book_name like "%돈%"
group by
	category_id;
    
# ★subquery는 3번 안에 끝내야 한다.★
select
	*
from
	(select
		book_id,
		count(*) as category_count
	from
		book_tb
	where
		book_name like "%돈%"
	group by
		category_id
    ) as temp_tb
where
	category_count > 10;
    
select
	book_id,
	count(*) as category_count
from
	book_tb
where
	book_name like "%돈%"
group by
	category_id
# having은 select 이후의 조건
having
	category_count > 10;