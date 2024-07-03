-- order by - 정렬
-- ASC > 오름차순 (생략 가능), DESC > 내림차순 (생략 불가능)
select
	*
from
	category_tb
order by
	category_id asc;
    
select
	*
from
	book_tb
order by
	publisher_id desc,
    category_id asc,
    book_id desc;