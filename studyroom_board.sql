drop table studyroom;
create table studyroom(
    study_name varchar2(50) constraint pk_stroom primary key,
    study_tag varchar2(30) not null,
    region varchar2(30),
    max_number number(5)    
);
--studyroom 생성 후 alter문으로 신청 가능 멤버 수를 나타내는 cur_number 칼럼을 추가
alter table studyroom add(cur_number number(5));
--cur_number의 초기값을 max_number 신청 정원으로 한다.
update studyroom s1 set cur_number = (select max_number from studyroom s2 where s1.study_name = s2.study_name);

commit;
--------------------------------------

select rownum from studyroom ;
select * from studyroom order by rownum desc;
select * from studyroom;
delete from studyroom ;
commit;

update STUDYROOM set cur_number = cur_number-1 where study_name='한국사 2주 완성 스터디';
select * from studyroom;


----스터디 이름, 태그명, 오프라인 장소, 정원, 신청 가능 인원 으로 insert를 받는다.
--화면 상에서는 스터디 등록 시, cur_number가 max_number의 수로 자동으로 들어가도록 설정했다.
insert into studyroom values('토익스피킹 스터디','외국어','신논현 투썸','5','5');
insert into studyroom values('기술 면접 준비','면접','이수역 부근','12','12');
insert into studyroom values('중간고사 스터디윗미','스터디윗미','기타','30','30');
insert into studyroom values('2차 가창 실기','기타','부산 해운대 중동','7','7');
insert into studyroom values('테니스 동호회 회원 모집합니다','대외활동','용인수지체육공원','20','20');
insert into studyroom values('파이썬 기초','스터디윗미','전북 익산 풀덤','15','15');
insert into studyroom values('논술 코칭','스터디윗미','대치 한티역 K논술학원','40','40');
insert into studyroom values('인국공 토론 면접 같이 준비해요','면접','한양대 부근','8','8');


commit;