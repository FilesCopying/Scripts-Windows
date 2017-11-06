REM Change time source in windows
REM Source: http://www.winsysadminblog.com/2011/06/how-to-set-and-change-an-ntp-time-source-in-windows-server-2008-r2-sbs-2011-and-vanilla-server/

w32tm /query /source
w32tm /config /manualpeerlist:pool.ntp.org
net stop w32time
net start w32time

PAUSE
w32tm /query /source

PAUSE