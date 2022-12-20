@ECHO OFF
: Sets the proper date and time stamp with 24Hr Time for log file naming
: convention

SET HOUR=%time:~0,2%
SET dtStamp9=%date:~-4%%date:~4,2%%date:~7,2%_0%time:~1,1%%time:~3,2%%time:~6,2% 
SET dtStamp24=%date:~-5,4%%date:~7,2%%date:~4,2%%time:~0,2%%time:~3,2%%time:~6,2%


if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)

set naziv=BackupPP27_%dtStamp%.sql

c:\xampp\mysql\bin\mysqldump -uroot edunovaPP27 > e:\%naziv%


ECHO "GOTOV"
