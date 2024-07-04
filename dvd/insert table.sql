SELECT * FROM dvd_db.sample_dvd_tb;
#중복제거 방식은 데이터를 보고 결정하는 것이 필요 (명령문이 실행되는 순서가 있기 때문에 고민해봐야 함)

-- producer insert
insert into
	producer_tb
select
	distinct
    0,
	제작자
from
	sample_dvd_tb;
    
-- publisher insert
insert into
	publisher_tb(publisher_name)
select
	# nullif() > 해당 값이 ""면 null을 넣어줘라
    nullif(발행자, "") as publisher_name
    # ifnull() > 해당 값이 null이면 ""을 넣어줘라
    # replace(key, value, changedValue): 해당 값이면 " "면 ""로 바꿔라
    -- ifnull(nullif(replace(발행자, " ", ""), ""), "발행자 없음")
from
	sample_dvd_tb
group by
	발행자
having
	nullif(발행자, "") is not null;

-- insert normalized data
insert into
	dvd_tb
select
	0,
    등록번호,
    제목,
    pdt.producer_id,
    pbt.publisher_id,
    발행년,
    데이터기준일자
from
	sample_dvd_tb sdt
    left outer join producer_tb pdt on(pdt.producer_name = sdt.제작자)
    left outer join publisher_tb pbt on(pbt.publisher_name = sdt.발행자);