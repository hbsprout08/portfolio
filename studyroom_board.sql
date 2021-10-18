drop table studyroom;
create table studyroom(
    study_name varchar2(50) constraint pk_stroom primary key,
    study_tag varchar2(30) not null,
    region varchar2(30),
    max_number number(5)    
);
--studyroom ���� �� alter������ ��û ���� ��� ���� ��Ÿ���� cur_number Į���� �߰�
alter table studyroom add(cur_number number(5));
--cur_number�� �ʱⰪ�� max_number ��û �������� �Ѵ�.
update studyroom s1 set cur_number = (select max_number from studyroom s2 where s1.study_name = s2.study_name);

commit;
--------------------------------------

select rownum from studyroom ;
select * from studyroom order by rownum desc;
select * from studyroom;
delete from studyroom ;
commit;

update STUDYROOM set cur_number = cur_number-1 where study_name='�ѱ��� 2�� �ϼ� ���͵�';
select * from studyroom;


----���͵� �̸�, �±׸�, �������� ���, ����, ��û ���� �ο� ���� insert�� �޴´�.
--ȭ�� �󿡼��� ���͵� ��� ��, cur_number�� max_number�� ���� �ڵ����� ������ �����ߴ�.
insert into studyroom values('���ͽ���ŷ ���͵�','�ܱ���','�ų��� ����','5','5');
insert into studyroom values('��� ���� �غ�','����','�̼��� �α�','12','12');
insert into studyroom values('�߰���� ���͵�����','���͵�����','��Ÿ','30','30');
insert into studyroom values('2�� ��â �Ǳ�','��Ÿ','�λ� �ؿ�� �ߵ�','7','7');
insert into studyroom values('�״Ͻ� ��ȣȸ ȸ�� �����մϴ�','���Ȱ��','���μ���ü������','20','20');
insert into studyroom values('���̽� ����','���͵�����','���� �ͻ� Ǯ��','15','15');
insert into studyroom values('��� ��Ī','���͵�����','��ġ ��Ƽ�� K����п�','40','40');
insert into studyroom values('�α��� ��� ���� ���� �غ��ؿ�','����','�Ѿ�� �α�','8','8');


commit;