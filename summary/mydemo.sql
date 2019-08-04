--��ѯ20�Ų��ŵ�����Ա����Ϣ��
select e.*
from emp e
where e.deptno = 20;

--��ѯ���й���ΪCLERK��Ա���Ĺ��š�Ա�����Ͳ�������
select e.empno,e.ename,e.deptno
from emp e 
where e.job = 'CLERK';

--��ѯ����COMM�����ڹ��ʣ�SAL����Ա����Ϣ��
select e.*
from emp e where e.comm>e.sal

--��ѯ������ڹ��ʵ�20%��Ա����Ϣ��
select * from emp where comm > (sal*0.2);

--��ѯ10�Ų����й���ΪMANAGER��20�Ų����й���ΪCLERK��Ա������Ϣ��
select e.*
from emp e where (e.job = 'MANAGER' and e.deptno = 10) or
                 (e.job = 'CLERK' and e.deptno = 20)

--��ѯ���й��ֲ���MANAGER��CLERK���ҹ��ʴ��ڻ����2000��Ա������ϸ��Ϣ��
select e.*
from emp e
where e.job not in('MANAGER','CLERK') and e.sal>=2000;

--��ѯ�н����Ա���Ĳ�ͬ���֡�
select  distinct e.job
from emp e where e.comm is not null

--��ѯ����Ա�����ʺͽ���ĺ͡�
select e.ename,e.sal+(nvl(e.comm,0))
from emp e 

--��ѯû�н���򽱽����100��Ա����Ϣ��
select e.*
from emp e where e.comm<100 or e.comm is null;

--��ѯ���µ�����2����ְ��Ա����Ϣ��
select e.* from emp e
where e.hiredate in(select (last_day(emp.hiredate)-1)from emp)

--��ѯԱ��������ڻ����10���Ա����Ϣ��
select e.* from emp e
where (to_char(sysdate,'yyyy') - to_char(e.hiredate,'yyyy')) >=39;

select * from emp where (sysdate - hiredate)/365 >= 30 ;

--��ѯԱ����Ϣ��Ҫ��������ĸ��д�ķ�ʽ��ʾ����Ա����������
--��ѯ����ǰ������ĸ
select substr(ename,1,3)from emp;

--S�滻s
select replace(ename,'S','s')from emp;

--����ְ����
select e.ename,e.hiredate from emp e
order by e.hiredate desc

--��ѯ2�·���ְ��Ա����Ϣ
select e.* from emp e
where to_char(e.hiredate,'mm')=2;

--��ѯ����Ա����ְ�Ĺ�������
select ename,floor((sysdate-hiredate)/365)
||'��'||floor(mod((sysdate-hiredate),365)/30)
||'��'||ceil(mod(mod((sysdate-hiredate),365),30))
||'��' from emp ;

--��ѯ���ʱ�Smith�ߵ�Ա����Ϣ
select * from emp where sal>=(select sal from emp where ename = 'SMITH');

--��ѯ����Ա���ϼ�����
select e.*
from emp e join emp m on e.empno = m.mgr 

--������5-10
select vt2.* from
(select vt.*,rownum num from
(select e.ename,e.sal
from emp e order by e.sal)vt
where rownum >= 1)vt2
where vt2.num between 5 and 10;

--------------------------------------------------------------

--��������Լ��

create table tb_user(
       userid number(5) primary key,
       username varchar2(30) not null check(length(username) between 4 and 20),
       userpwd varchar2(20) not null check(length(userpwd) between 4 and 18),
       age number(3) default(18) check(age>=18),
       gender char(3) default('��') check(gender in('��','Ů')),
       email varchar2(30) unique,
       regtime date default(sysdate)   
)

create table tb_txt(
       txtid number(5) primary key,
       title varchar2(32) not null check(length(title) between 4 and 30),
       txt varchar2(1024),
       pubrime date default(sysdate),
       userid number(5) references tb_user(userid) on delete set null
)
















