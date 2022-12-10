--직원관리 테이블
create table WORKER (
worker_no number(10),
worker_id varchar2(20),
pwd varchar2(20) not null,
name varchar2(20) not null,
phone varchar2(20) not null,
gender number(1) not null,
age number(3) not null,
grade number(1) not null, 
fileupload varchar2(100), 
join_date varchar2(20),
del_date varchar2(20), 
CONSTRAINT WORKER_PK PRIMARY KEY (worker_id)
)

drop table WORKER

select * from WORKER
--직원 insert
insert into WORKER (
			worker_no, 
			worker_id, 
			pwd, 
			name, 
			phone, 
			gender, 
			age, 
			grade, 
			join_date
		) values (
			(select nvl(max(worker_no),0)+1 from WORKER), 
			'test1', 
			'1111',
			'테스트1',
			'01011111111', 
			0, 
			21, 
			0, 
			TO_CHAR(SYSDATE, 'YYYY-MM-DD- HH24:MI:SS')
		)
		
insert into WORKER (
	worker_no, worker_id, pwd, name, phone, gender, age, grade, join_date
) values (
	(select nvl(max(worker_no),0)+1 from WORKER), 'admin', '1234','사장님','01012345678', 0, 35, 0, TO_CHAR(SYSDATE, 'YYYY-MM-DD- HH24:MI:SS')
);

update WORKER set name='알바생1' where worker_no=2;

insert into WORKER (
	worker_no, worker_id, pwd, name, phone, gender, age, grade, join_date
) values (
	(select nvl(max(worker_no),0)+1 from WORKER), 'worker2', '1234','알바생','01012322678', 0, 20, 0, TO_CHAR(SYSDATE, 'YYYY-MM-DD- HH24:MI:SS')
);



--스케줄 날짜:시간 
create table SCHEDULE (
seq number(10) primary key, 
worker_no number(5) ,
work_start_date varchar2(20) not null,
work_end_date varchar2(20) not null 
)
--필요한거 : pk를 제거하면 동일값이 들어갈 수 있음 예외처리 필요(이미 존재하는 스케줄이므로)


drop table SCHEDULE

insert into SCHEDULE(seq,worker_no,work_start_date,work_end_date) values ((select nvl(max(seq),0)+1 from SCHEDULE),2, '2022-11-13T09:00:00', '2022-11-13T18:00:00');
insert into SCHEDULE values (2, '2022-11-04T09:00:00', '2022-11-04T18:00:00');
insert into SCHEDULE values (1, '2022-11-12T09:00:00', '2022-11-12T18:00:00');
insert into SCHEDULE values (1, '2022-11-19T09:00:00', '2022-11-19T18:00:00');
insert into SCHEDULE values (3, '2022-11-01T10:30:00', '2022-11-01T18:30:00');
insert into SCHEDULE values (3, '2022-11-07T10:30:00', '2022-11-07T18:30:00');
insert into SCHEDULE values (2, '2022-11-07T10:30:00', '2022-11-07T18:30:00');
insert into SCHEDULE values (2, '2022-11-17T10:30:00', '2022-11-20T18:30:00')

UPDATE WORKER A, SCHEDULE B 
		SET B.work_start_date=#{work_start_date},B.work_end_date=#{work_end_date}
		WHERE A.worker_no = #{B.worker_no}
		
update SCHEDULE set work_end_date = '2022-11-01T18:30:00' where worker_no = 2 and work_start_date = '2022-11-01T10:30:00'
select * from SCHEDULE

select A.user_no, name, B.work_start_date, B.work_end_date from PAYSLIP_USER A, SCHEDULE B WHERE A.user_no = B.user_no

--2021-07-13T07:00:00