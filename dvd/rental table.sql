insert into dvd_register_tb
values
	(0, 1, now()),
	(0, 1, now()),
	(0, 1, now());
    
# union 3번
select
	0,
    dvd_id,
    now()
from
	dvd_tb
union all
select
	0,
    dvd_id,
    now()
from
	dvd_tb
union all
select
	0,
    dvd_id,
    now()
from
	dvd_tb
order by
	dvd_id;

# 다:다 매칭
select
	*
from
	dvd_tb dt
	left outer join dvd_tb ndt on (ndt.dvd_id < 4);
    
#resiter 테이블에 모든 dvd를 3개씩 넣기
insert into dvd_register_tb
select
	0,
	dt.dvd_id,
    now()
from
	dvd_tb dt
	left outer join dvd_tb ndt on (ndt.dvd_id < 4);
    
#같은 dvd가 등록되어 있는지 확인
select
	title,
    producer_id,
    publisher_id,
    count(*) as dvd_count
from
	dvd_tb
group by
	title,
    producer_id,
    publisher_id
having
	dvd_count > 1;
    
#dvd 빌리는 행위
insert into
	rental_tb
values
	(0, 1, "김준일", now());
    
    
select
	*
from
	rental_tb rt
    left outer join (
			select
				distinct
				0 as rental_id,
				floor(rand() * 3000) + 1 as dvd_id,
				"김준일" as customer_name,
				now() as rental_date
			from
				dvd_tb
			where
				dvd_id < 1001
			order by
				dvd_id) rt2 on (rt2.dvd_id);