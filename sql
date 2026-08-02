database:  storage that's optimized for asking questions.
 When you write a SQL query, you're basically saying: 
 "Hey database, give me this data, from this table, where these conditions are true."

table

-------------------------------
emp_id | emp_name | emp_salary |
-------------------------------




 1) what we want

 SELECT columnsname FROM tablename;
 SELECT - which columns we want to show
 FROM - which table we want to use to retrieve the data from

Use AS to create readable column aliases — always write it explicitly.
DISTINCT removes duplicate rows from results — it applies to the entire row, not just the first column.


SELC