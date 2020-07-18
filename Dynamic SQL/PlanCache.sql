
--How to Use Plan cache
SELECT cp.usecounts, cp.cacheobjtype, cp.objtype, st.text, qp.query_plan
FROM sys.dm_exec_cached_plans AS cp
CROSS APPLY sys.dm_exec_sql_text(plan_handle) AS st
CROSS APPLY sys.dm_exec_query_plan(plan_handle) AS qp
ORDER BY cp.usecounts DESC
--To remove all elements in Plan cache
DBCC FREEPROCCACHE