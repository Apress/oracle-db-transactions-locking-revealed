-- Measuring Redo

set echo on

drop table t purge;
create table t as select * from big_table;

set autotrace traceonly statistics;
truncate table t;
--
insert into t
select * from big_table;

truncate table t;

insert /*+ APPEND */ into t
select * from big_table;
