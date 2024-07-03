# 출판사를 기준으로 category의 count를 집계한다.
select
	*
from
	(
    select
		#rank() over(partition by publisher_id order by book_count desc) as `num`,
		#dense_rank() over(partition by publisher_id order by book_count desc) as `dense_rank`,
		row_number() over(partition by publisher_id order by book_count desc) as `num`,
		pc_count_tb.*
	from
		(
		select
			publisher_id,
			category_id,
			count(*) as book_count
		from
			book_tb
		group by
			publisher_id,
			category_id
		)as pc_count_tb) as book_row_number_tb
where
	num = 1;

# rank() over(partition by) > 주어진 조건(partition by)안에서 공동 순위를 포함하여 순위를 매겨줌 (1,2,2,4)
# row_number > 주어진 조건(partition by)안에서 공동 순위 없이 순위를 매겨줌 (값이 같을 경우 정렬 순서에 맞게 순차적으로 순위 부여) (1,2,3,4)
# dense_rank > 주어진 조건(partition by)안에서 공동 순위를 포함하여 순위를 매겨주는데, 비어있는 순위가 없이 순위 매겨줌 (1,2,2,3)
# partition by > 순위를 매기는 기준 (없으면 전체 테이블에서 rank를 매김)
select
	#rank() over(partition by publisher_id order by book_count desc) as `rank`,
	row_number() over(partition by publisher_id order by book_count desc) as `rank`,
	pc_count_tb.*
from
	(
    select
		publisher_id,
		category_id,
		count(*) as book_count
	from
		book_tb
	group by
		publisher_id,
		category_id
    )as pc_count_tb;