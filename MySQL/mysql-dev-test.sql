DROP TABLE employee;
CREATE TABLE employee (id bigint(10) NOT NULL AUTO_INCREMENT, first_name varchar(50) COLLATE utf8_unicode_ci, last_name varchar(50) COLLATE utf8_unicode_ci, birth_date date NOT NULL, cell_phone varchar(15) COLLATE utf8_unicode_ci, PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO employee (id, first_name, last_name, birth_date, cell_phone) VALUES (1, 'admin', 'admin', '2016-07-13', '1234567890');
INSERT INTO employee (id, first_name, last_name, birth_date, cell_phone) VALUES (34, '??1', '??1', '2016-08-03', '1234567890');
DROP TABLE exception_record;
CREATE TABLE exception_record (date datetime NOT NULL, cause varchar(1024) COLLATE utf8_unicode_ci NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO exception_record (date, cause) VALUES ('2016-05-12 17:00:04', 'Unresolved compilation problem: 
	Syntax error on token "class", Identifier expected
');
INSERT INTO exception_record (date, cause) VALUES ('2016-05-13 14:49:36', '
### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column ''cause'' cannot be null
### The error may involve com.rwd.bootstrap.mapper.ExceptionRecordMapper.insert-Inline
### The error occurred while setting parameters
### SQL: insert into exception_record (date, cause)     values (?, ?)
### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column ''cause'' cannot be null
; SQL []; Column ''cause'' cannot be null; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column ''cause'' cannot be null');
INSERT INTO exception_record (date, cause) VALUES ('2016-05-13 14:53:12', '
### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column ''cause'' cannot be null
### The error may involve com.rwd.bootstrap.mapper.ExceptionRecordMapper.insert-Inline
### The error occurred while setting parameters
### SQL: insert into exception_record (date, cause)     values (?, ?)
### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column ''cause'' cannot be null
; SQL []; Column ''cause'' cannot be null; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column ''cause'' cannot be null');
DROP TABLE user;
CREATE TABLE user (id int(255) NOT NULL AUTO_INCREMENT, img varchar(1024) COLLATE utf8_unicode_ci COMMENT '??', account varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '??', password varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '??', PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO user (id, img, account, password) VALUES (1, 'D:\eclipse-mars\workspace\SpringRestv2\WebContent\resources\userImg\admin.png', 'admin', 'admin');
